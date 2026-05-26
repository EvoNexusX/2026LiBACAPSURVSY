function is_valid = check_constraints(berths, start_times, assigned_qcs, ships)
    N = length(ships);
    is_valid = true;

    % Check the number of cranes assigned to each ship
    for i = 1:N
        num_assigned = length(assigned_qcs{i});
        if num_assigned < 1 || num_assigned > ships(i).max_qc
            is_valid = false;
            return;
        end
    end
    % ---- 1. Check berth conflict (time + space) ----
    for i = 1:N
        for j = i+1:N
            % Time ranges
            ti1 = start_times(i);
            ti2 = start_times(j);
            te1 = ti1 + ships(i).service_time;
            te2 = ti2 + ships(j).service_time;
            time_overlap = ~(te1 <= ti2 || te2 <= ti1);

            % Space ranges
            bi1 = berths(i);
            bi2 = berths(j);
            bl1 = ships(i).length;
            bl2 = ships(j).length;
            space_overlap = ~(bi1 + bl1 <= bi2 || bi2 + bl2 <= bi1);

            if time_overlap && space_overlap
                is_valid = false;
                return;
            end
        end
    end

    % ---- 2. Check crane conflict (time + spatial center distance) ----
    num_qc = max(cellfun(@(x) max([0 x]), assigned_qcs)); % Allow empty assignments
    %all_qcs = unique([assigned_qcs{:}]);
    %if isempty(all_qcs)
     %   is_valid = false;
      %  return;
    %end
    %num_qc = max(all_qcs);

    for q = 1:num_qc
        tasks = [];  % Each task: [start_time, end_time, center_position]

        for i = 1:N
            if any(assigned_qcs{i} == q)
                st = start_times(i);
                et = st + ships(i).service_time;
                center_pos = berths(i) + ships(i).length / 2;
                tasks = [tasks; st, et, center_pos];
            end
        end

        % Check for conflicts
        for m = 1:size(tasks,1)
            for n = m+1:size(tasks,1)
                time_overlap = ~(tasks(m,2) <= tasks(n,1) || tasks(n,2) <= tasks(m,1));
                space_conflict = abs(tasks(m,3) - tasks(n,3)) < 50;
                if time_overlap && space_conflict
                    is_valid = false;
                    return;
                end
            end
        end
    end
end