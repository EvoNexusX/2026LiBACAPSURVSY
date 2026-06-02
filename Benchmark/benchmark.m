function [average_port_time, robustness_index] = benchmark(ship, crane, tidalwindow, general, solution)
    %% Extract data
    V = size(ship, 1);  % Number of ships
    Q = size(crane, 1); % Number of quay cranes
    T = ship(:, 1);     % Arrival time
    L = ship(:, 3);     % Ship length
    D = ship(:, 4);     % Original handling time
    qc_status = crane(:, 2); % Crane availability

    % Decode solution
    berth_pos = cell2mat(solution(:, 1));    % Berth position
    start_time = cell2mat(solution(:, 2));   % Start time
    qc_sum = cell2mat(solution(:, 3));       % Number of assigned cranes
    qc_assigned = solution(:, 4);            % Crane IDs (cell array)

    %% Calculate adjusted handling time
    adjusted_D = zeros(V, 1);
    for i = 1:V
        cranes = qc_assigned{i};
        valid_cranes = cranes(cranes >= 1 & cranes <= Q);
        available = sum(qc_status(valid_cranes) == 1);
        if available == 0
            adjusted_D(i) = 2 * D(i);  % No valid crane: penalty
        else
            adjusted_D(i) = D(i) * qc_sum(i) / available; 
        end
    end

    %% Calculate average port time (considering tide and arrival deviation)
    total_port_time = 0;
    for i = 1:V
        % Check if within tidal window
        in_window = false;
        for k = 1:size(tidalwindow, 1)
            if start_time(i) >= tidalwindow(k, 1) && start_time(i) <= tidalwindow(k, 2)
                total_port_time = total_port_time + adjusted_D(i);
                in_window = true;
                break;
            end
        end
        % Waiting outside tidal window
        if ~in_window
            next_window = find(tidalwindow(:, 1) > start_time(i), 1);
            if isempty(next_window)
                wait_time = start_time(i) - tidalwindow(end, 2);
            else
                wait_time = tidalwindow(next_window, 1) - start_time(i);
            end
            total_port_time = total_port_time + adjusted_D(i) + wait_time;
        end
        % Add arrival time deviation
        total_port_time = total_port_time + abs(start_time(i) - T(i));
    end
    average_port_time = total_port_time / V;

    %% Crane utilization + berth utilization
    total_crane_time = zeros(Q, 1);
    for i = 1:V
        cranes = qc_assigned{i};
        valid_cranes = cranes(cranes >= 1 & cranes <= Q);
        available_cranes = valid_cranes(qc_status(valid_cranes) == 1);
        for j = 1:length(available_cranes)
            c = available_cranes(j);
            total_crane_time(c) = total_crane_time(c) + adjusted_D(i);
        end
    end

    % Utilization and idle ratio
    max_time = max(total_crane_time);
    average_idle_time = sum(max_time - total_crane_time) / Q;
    average_crane_utilization = sum(total_crane_time) / (Q * max_time);

    % Berth utilization (estimated based on maximum operation time)
    max_start_time = max(start_time + adjusted_D);
    berth_utilization = sum(adjusted_D) / (V * max_start_time);

    %% Call robustness evaluation function
    robustness_index = evaluate_robustness(ship, crane, tidalwindow, solution);

end
