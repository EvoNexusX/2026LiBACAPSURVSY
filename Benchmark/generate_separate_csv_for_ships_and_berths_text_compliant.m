function [ship_data, berth_data, qc_time_data, weather_state_data, efficiency_state_data, tidal_windows] = generate_separate_csv_for_ships_and_berths_text_compliant(shipinfo, berthinfo)
%GENERATE_SEPARATE_CSV_FOR_SHIPS_AND_BERTHS
% Data generator for uncertain BACAP consistent with the manuscript description:
% 1) Vessel-arrival deviations:
%    t_i = a_i + f_w(eta_w(a_i)) + M1*xi_i + M2*zeta_i
%    eta_w(t): 3-state Markov chain; xi_i ~ Poisson(lambda);
%    zeta_i ~ non-negative truncated normal.
% 2) Handling-duration fluctuations:
%    h_i = h_i^0 + g_w(eta_w(s_i)) + g_e(eta_e(s_i)) + M3*vartheta_i
%    eta_e(t): 3-state Markov chain; vartheta_i ~ non-negative truncated normal.
% 3) QC availability:
%    A_{k,t}: 2-state Markov chain for each QC and each time period.
% 4) Tidal windows:
%    Service start s_i must be inside admissible tidal windows; otherwise it is postponed.

    %% Read input data
    ship_file = shipinfo + ".xlsx";
    berth_file = berthinfo + ".xlsx";
    ship = xlsread(ship_file);
    qc = xlsread(berth_file);

    % Expected ship columns:
    % col 1: nominal arrival time a_i
    % col 2: cargo/load or weight
    % col 3: vessel length
    % col 4: nominal handling duration h_i^0 OR required QC depending on old file format
    % col 5: fuel consumption
    % col 6: nominal handling duration h_i^0 OR required QC depending on old file format
    %
    % To preserve compatibility with the first code, this function assumes:
    % ship(:,1) = nominal arrival time
    % ship(:,2) = cargo/load
    % ship(:,3) = vessel length
    % ship(:,4) = required QC number
    % ship(:,5) = fuel consumption
    % ship(:,6) = nominal handling duration
    if size(ship, 2) < 6
        error('ship input must contain at least 6 columns: arrival, cargo, length, required QC, fuel, nominal handling duration.');
    end
    if size(qc, 2) < 2
        error('berth/QC input must contain at least 2 columns: QC ID and initial availability.');
    end

    a = ship(:, 1);          % nominal arrival time
    ship_w = ship(:, 2);     % cargo/load
    ship_len = ship(:, 3);   % vessel length
     h0 = ship(:, 4);    % required/planned QC number
    ship_so = ship(:, 5);    % fuel consumption
     ship_Qm = ship(:, 6);         % nominal handling duration

    num_ships = size(ship, 1);
    num_qc = size(qc, 1);

    %% General information
    coast_length = input('Please enter the coastline length (meters): ');

    %% Time horizon and discretization
    H = input('Please enter the planning horizon H (e.g., 24, 48, 72): ');
    if isempty(H) || H <= 0
        error('Planning horizon H must be positive.');
    end

    %% Tidal windows
    tidal_windows = [];
    num_windows = input('Please enter the number of tidal windows: ');
    for g = 1:num_windows
        fprintf('Please enter tidal window %d:\n', g);
        start_time = input('  start time: ');
        end_time = input('  end time: ');
        if end_time < start_time
            error('Tidal window end time must be >= start time.');
        end
        tidal_windows = [tidal_windows; start_time, end_time]; %#ok<AGROW>
    end
    if isempty(tidal_windows)
        error('At least one tidal window is required by the text description.');
    end
    tidal_windows = sortrows(tidal_windows, 1);

    %% Arrival-time uncertainty parameters
    disp('Arrival-time uncertainty');
    lambda = input('Poisson parameter lambda for maritime congestion events: ');
    M1 = input('M1: traffic-delay scaling coefficient: ');
    theta_v = input('theta_v: mean of vessel-performance disturbance: ');
    varrho_v = input('varrho_v: standard deviation of vessel-performance disturbance: ');
    M2 = input('M2: vessel-performance-delay scaling coefficient: ');

    %% Handling-duration uncertainty parameters
    disp('Handling-duration uncertainty');
    theta_c = input('theta_c: mean of stochastic handling disturbance: ');
    varrho_c = input('varrho_c: standard deviation of stochastic handling disturbance: ');
    M3 = input('M3: handling-disturbance scaling coefficient: ');

    %% Weather Markov chain eta_w(t) in {0,1,2}
    disp('Weather Markov chain: states 0 normal, 1 slightly adverse, 2 severely adverse.');
    P_w = input('Please enter 3x3 weather transition matrix P_w, e.g. [0.7 0.2 0.1; 0.3 0.5 0.2; 0.2 0.3 0.5]: ');
    validate_transition_matrix(P_w, 3, 'P_w');

    delta_w_arrival = input('Please enter 1x3 weather arrival-delay vector delta_w, e.g. [0 0.5 2]: ');
    validate_delay_vector(delta_w_arrival, 3, 'delta_w');

    delta_hw = input('Please enter 1x3 weather handling-delay vector delta_h_w, e.g. [0 0.5 1.5]: ');
    validate_delay_vector(delta_hw, 3, 'delta_h_w');

    initial_weather = input('Initial weather state, 0/1/2: ');
    if ~ismember(initial_weather, [0 1 2])
        error('Initial weather state must be 0, 1, or 2.');
    end

    %% Operational efficiency Markov chain eta_e(t) in {0,1,2}
    disp('Operational-efficiency Markov chain: states 0 high, 1 moderate, 2 low productivity.');
    P_e = input('Please enter 3x3 efficiency transition matrix P_e, e.g. [0.6 0.3 0.1; 0.2 0.6 0.2; 0.1 0.3 0.6]: ');
    validate_transition_matrix(P_e, 3, 'P_e');

    delta_e = input('Please enter 1x3 efficiency handling-delay vector delta_e, e.g. [0 0.5 1.5]: ');
    validate_delay_vector(delta_e, 3, 'delta_e');

    initial_efficiency = input('Initial efficiency state, 0/1/2: ');
    if ~ismember(initial_efficiency, [0 1 2])
        error('Initial efficiency state must be 0, 1, or 2.');
    end

    %% QC availability Markov chain A_{k,t} in {0,1}
    disp('QC availability Markov chain: state 0 unavailable, state 1 available.');
    P_q = input('Please enter 2x2 QC transition matrix P_q with row order [0 unavailable; 1 available], e.g. [0.7 0.3; 0.15 0.85]: ');
    validate_transition_matrix(P_q, 2, 'P_q');

    %% Generate Markov state trajectories over time periods 0,...,H
    weather_states = zeros(H + 1, 1);
    efficiency_states = zeros(H + 1, 1);
    weather_states(1) = initial_weather;
    efficiency_states(1) = initial_efficiency;

    for t = 2:(H + 1)
        weather_states(t) = sample_markov_state(weather_states(t - 1), P_w, [0 1 2]);
        efficiency_states(t) = sample_markov_state(efficiency_states(t - 1), P_e, [0 1 2]);
    end

    %% Generate QC availability A_{k,t}
    qc_initial = qc(:, 2);
    qc_initial = double(qc_initial ~= 0);  % force binary
    qc_availability = zeros(num_qc, H + 1);
    qc_availability(:, 1) = qc_initial;

    for k = 1:num_qc
        for t = 2:(H + 1)
            qc_availability(k, t) = sample_markov_state(qc_availability(k, t - 1), P_q, [0 1]);
        end
    end

    %% Generate ship data
    ship_data = zeros(num_ships, 6);
    % Columns:
    % 1 actual arrival time
    % 2 cargo/load
    % 3 vessel length
    % 4 planned/required QC number
    % 5 fuel consumption
    % 6 realized handling duration
    % 7 tidal-adjusted service start time
    % 8 realized number of operational QCs during service

    for i = 1:num_ships
        nominal_arrival_idx = time_to_index(a(i), H);

        % t_i = a_i + f_w(eta_w(a_i)) + M1*xi_i + M2*zeta_i
        weather_state_at_arrival = weather_states(nominal_arrival_idx);
        weather_arrival_delay = delta_w_arrival(weather_state_at_arrival + 1);

        xi_i = poissrnd(lambda);
        zeta_i = truncated_normal_nonnegative(theta_v, varrho_v);

        actual_arrival = a(i) + weather_arrival_delay + M1 * xi_i + M2 * zeta_i;
        actual_arrival = max(actual_arrival, 0);

        % Service start is initially actual arrival and then adjusted by tidal windows.
        service_start = adjust_to_tidal_window(actual_arrival, tidal_windows);

        service_start_idx = time_to_index(service_start, H);

        % h_i = h_i^0 + g_w(eta_w(s_i)) + g_e(eta_e(s_i)) + M3*vartheta_i
        weather_state_at_service = weather_states(service_start_idx);
        efficiency_state_at_service = efficiency_states(service_start_idx);

        handling_weather_delay = delta_hw(weather_state_at_service + 1);
        handling_efficiency_delay = delta_e(efficiency_state_at_service + 1);
        vartheta_i = truncated_normal_nonnegative(theta_c, varrho_c);

        realized_handling = h0(i) + handling_weather_delay + handling_efficiency_delay + M3 * vartheta_i;
        realized_handling = max(realized_handling, 0);

        % q_i^real from QC availability states of planned QCs.
        % If the input only specifies required QC count, use the first q_i planned cranes.
        planned_qc_count = min(max(round(ship_Qm(i)), 0), num_qc);
        planned_qcs = 1:planned_qc_count;

        service_end = min(service_start + realized_handling, H);
        start_idx = time_to_index(service_start, H);
        end_idx = time_to_index(service_end, H);

        if planned_qc_count > 0
            availability_slice = qc_availability(planned_qcs, start_idx:end_idx);
            q_real_by_period = sum(availability_slice, 1);
            q_real = mean(q_real_by_period);  % average operational QCs during service
        else
            q_real = 0;
        end

        ship_data(i, :) = [actual_arrival, ship_w(i), ship_len(i), ship_Qm(i), ship_so(i), realized_handling];
    end

    %% Output berth/QC data
    % berth_data keeps one current/initial summary per QC for compatibility.
    berth_data = [(1:num_qc)', qc_availability(:, end)];

    % Long-format QC time availability: QC ID, time, availability
    qc_time_data = zeros(num_qc * (H + 1), 3);
    row = 1;
    for k = 1:num_qc
        for t = 0:H
            qc_time_data(row, :) = [k, t, qc_availability(k, t + 1)];
            row = row + 1;
        end
    end

    weather_state_data = [(0:H)', weather_states];
    efficiency_state_data = [(0:H)', efficiency_states];

    %% Write CSV files
    writecell([{'Actual Arrival Time', 'Cargo/Load', 'Vessel Length', 'Planned QC Count', 'Fuel', 'Realized Handling Duration'}; num2cell(ship_data)], 'ship_data.csv');

    writecell([{'QC ID','Final Availability'}; num2cell(berth_data)], 'berth_data.csv');

    writecell([{'Tidal Window Start', 'Tidal Window End'}; num2cell(tidal_windows)], 'tidal_window_data.csv');

    writecell([{'Coastline Length'}; {coast_length}], 'general_info_data.csv');

    disp('Data saved: ship_data.csv, berth_data.csv, tidal_window_data.csv, general_info_data.csv.');
end

%% ---------- Helper functions ----------

function validate_transition_matrix(P, n, name)
    if ~isequal(size(P), [n, n])
        error('%s must be a %dx%d matrix.', name, n, n);
    end
    if any(P(:) < 0)
        error('%s cannot contain negative probabilities.', name);
    end
    row_sums = sum(P, 2);
    if any(abs(row_sums - 1) > 1e-8)
        error('Each row of %s must sum to 1.', name);
    end
end

function validate_delay_vector(v, n, name)
    if ~(isvector(v) && numel(v) == n)
        error('%s must be a vector with %d elements.', name, n);
    end
    if any(v(:) < 0)
        error('%s must be non-negative.', name);
    end
end

function next_state = sample_markov_state(current_state, P, state_values)
    % P row order follows state_values.
    row_idx = find(state_values == current_state, 1);
    if isempty(row_idx)
        error('Current state is not included in state_values.');
    end
    cdf = cumsum(P(row_idx, :));
    u = rand();
    col_idx = find(u <= cdf, 1, 'first');
    next_state = state_values(col_idx);
end

function x = truncated_normal_nonnegative(mu, sigma)
    if sigma < 0
        error('Standard deviation must be non-negative.');
    end
    if sigma == 0
        x = max(mu, 0);
        return;
    end

    % Rejection sampling for N_+(mu, sigma^2)
    x = mu + sigma * randn();
    max_iter = 10000;
    iter = 0;
    while x < 0 && iter < max_iter
        x = mu + sigma * randn();
        iter = iter + 1;
    end

    % Fallback for extremely unlikely/poorly parameterized cases.
    if x < 0
        x = 0;
    end
end

function idx = time_to_index(t, H)
    % Converts continuous time to index for arrays representing periods 0,...,H.
    t_clipped = min(max(t, 0), H);
    idx = floor(t_clipped) + 1;
end

function s_adj = adjust_to_tidal_window(s, windows)
    % If s is inside any admissible window, keep it.
    % Otherwise postpone to the start of the next available window.
    windows = sortrows(windows, 1);

    for g = 1:size(windows, 1)
        if s >= windows(g, 1) && s <= windows(g, 2)
            s_adj = s;
            return;
        end
        if s < windows(g, 1)
            s_adj = windows(g, 1);
            return;
        end
    end

    % If s is later than all windows, postpone to the first window of the next cycle.
    % The cycle length is inferred from the last window end.
    cycle_length = windows(end, 2);
    if cycle_length <= 0
        error('Invalid tidal windows: last window end must be positive.');
    end
    s_adj = cycle_length + windows(1, 1);
end
