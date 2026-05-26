function robustness_index = evaluate_robustness(ship, crane, tidalwindow, solution)
    V = size(ship, 1);  % Number of ships
    Q = size(crane, 1); % Number of quay cranes
    T = ship(:, 1);     % Arrival time
    L = ship(:, 3);     % Ship length
    D = ship(:, 4);     % Original handling time
    qc_status = crane(:, 2);  % Crane availability (0/1)

    % Solution
    berth_pos = cell2mat(solution(:, 1));
    start_time = cell2mat(solution(:, 2));
    qc_sum = cell2mat(solution(:, 3));
    qc_assigned = solution(:, 4);

    % Calculate adjusted handling time
    adjusted_D = zeros(V, 1);
    for i = 1:V
        assigned = qc_assigned{i};
        valid_cranes = assigned(assigned >= 1 & assigned <= Q);
        available = sum(qc_status(valid_cranes) == 1);
        if available == 0
            adjusted_D(i) = 2 * D(i);  % Penalty for invalid crane assignment
        else
            adjusted_D(i) = D(i) * qc_sum(i) / available;
        end
    end

    % Survival time threshold (median)
    survival_threshold = median(D);
    survival_time = zeros(V, 1);

    for i = 1:V
        i_start = start_time(i);
        i_end = i_start + adjusted_D(i);
        i_berth_start = berth_pos(i);
        i_berth_end = i_berth_start + L(i);

        %% Tidal margin
        tidal_remain = 0;
        for k = 1:size(tidalwindow, 1)
            if tidalwindow(k, 1) <= i_start && i_start <= tidalwindow(k, 2)
                tidal_remain = tidalwindow(k, 2) - i_end;
                break;
            elseif k < size(tidalwindow, 1) && tidalwindow(k, 2) < i_start && tidalwindow(k + 1, 1) > i_start
                tidal_remain = 0;
                break;
            end
        end
        tidal_remain = max(tidal_remain, 0);

        %% Berth conflict
        berth_conflict_gap = Inf;
        for j = 1:V
            if i == j, continue; end
            j_start = start_time(j);
            j_berth_start = berth_pos(j);
            j_berth_end = j_berth_start + L(j);
            if (i_berth_start < j_berth_end) && (i_berth_end > j_berth_start)
                if j_start < i_end && j_start >= i_start
                    gap = i_end - j_start;
                    berth_conflict_gap = min(berth_conflict_gap, gap);
                end
            end
        end
        if isinf(berth_conflict_gap), berth_conflict_gap = 0; end

        %% Crane conflict
        crane_conflict_gap = Inf;
        valid_cranes_i = qc_assigned{i};
        valid_cranes_i = valid_cranes_i(valid_cranes_i >= 1 & valid_cranes_i <= Q);
        for j = 1:V
            if i == j, continue; end
            valid_cranes_j = qc_assigned{j};
            valid_cranes_j = valid_cranes_j(valid_cranes_j >= 1 & valid_cranes_j <= Q);
            if any(ismember(valid_cranes_i, valid_cranes_j))
                j_start = start_time(j);
                if j_start < i_end && j_start >= i_start
                    gap = i_end - j_start;
                    crane_conflict_gap = min(crane_conflict_gap, gap);
                end
            end
        end
        if isinf(crane_conflict_gap), crane_conflict_gap = 0; end

        % Survival time is non-negative
        survival_time(i) = max(tidal_remain + berth_conflict_gap + crane_conflict_gap, 0);
        %survival_time(i) = w1 * tidal_remain + w2 * berth_conflict_gap + w3 * crane_conflict_gap;
    end

    % Robustness index = average survival time of ships exceeding threshold
    valid_survival = survival_time(survival_time > survival_threshold);
    %valid_survival = survival_time(survival_time >= survival_threshold * alpha); % alpha ∈ [0.8, 1]
    if isempty(valid_survival)
        robustness_index = 0;
    else
        robustness_index = mean(valid_survival);
    end
end