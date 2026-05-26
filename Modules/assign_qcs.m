function [assigned_qcs, qc_usage] = assign_qcs(ship, berth_pos, start_time, end_time, ...
                                                qcs, qc_usage, qc_scores, total_berth_length)
% ASSIGN_QCS Assign available quay cranes to a given ship, considering time conflicts,
%            spatial conflicts, maximum crane limit, and spatial priority.
%
% Input arguments:
%   ship               - Current ship structure, containing fields such as max_qc, length
%   berth_pos          - Starting berth position of the ship
%   start_time         - Start time of ship operation
%   end_time           - End time of ship operation
%   qcs                - Array of quay crane structures, each contains 'available' field
%   qc_usage           - Cell array recording usage history of each crane
%   qc_scores          - Chromosome preference values of the current ship for each crane (1 × num_qcs)
%   total_berth_length - Total berth length (used to generate virtual crane positions)
%
% Output arguments:
%   assigned_qcs - Array of crane IDs assigned to the ship
%   qc_usage     - Updated crane usage records

    num_qcs = length(qcs);
    assigned_qcs = [];

    % Step 1: Calculate virtual crane positions (assuming equal spacing)
    qc_positions = linspace(0, total_berth_length, num_qcs);

    % Step 2: Ship berth center
    ship_center = berth_pos + ship.length / 2;

    % Step 3: Spatial distance (normalized)
    qc_distance = abs(qc_positions - ship_center);
    qc_distance = qc_distance / max(qc_distance);

    % Step 4: Composite score ranking (preference value + distance penalty)
    composite_score = qc_scores + 0.01 * qc_distance;
    [~, qc_rank] = sort(composite_score);  % Ascending order, smaller score means higher priority

    % Step 5: Assign available cranes (satisfying time and space non‑conflict)
    berth_end = berth_pos + ship.length;
    for k = 1:num_qcs
        qc_id = qc_rank(k);

        if ~qcs(qc_id).available
            continue;
        end

        % Check conflict
        is_conflict = false;
        usage_list = qc_usage{qc_id};

        for u = 1:length(usage_list)
            usage = usage_list{u};
            time_overlap = ~(end_time <= usage.start_time || start_time >= usage.end_time);
            space_overlap = ~(berth_end <= usage.berth_start || berth_pos >= usage.berth_end);

            if time_overlap && space_overlap
                is_conflict = true;
                break;
            end
        end

        % If no conflict, assign this crane
        if ~is_conflict
            assigned_qcs(end+1) = qc_id;

            % Update crane usage record
            usage_info = struct('start_time', start_time, 'end_time', end_time, ...
                                'berth_start', berth_pos, 'berth_end', berth_end);
            qc_usage{qc_id}{end+1} = usage_info;
        end

        % Stop when the maximum number of cranes is reached
        if length(assigned_qcs) >= ship.max_qc
            break;
        end
    end

    % Optional: warning output
    if isempty(assigned_qcs)
        fprintf('Ship could not be assigned any crane (possibly due to resource conflicts or limits).\n');
    end
end