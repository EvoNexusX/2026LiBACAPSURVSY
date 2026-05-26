function [berths, start_times, assigned_qcs] = decode_solution(individual, ships, qcs, berth_length)
    N = length(ships);
    num_qcs = length(qcs);
    [~, order] = sort([ships.arrival_time]);
    pos = individual(1:N);                     % Berth positions
    start = individual(N+1:2*N);               % Start times
    assign = individual(2*N+1:end);            % Crane assignments

    berths = zeros(1,N);
    start_times = zeros(1,N);
    assigned_qcs = cell(1,N);

    qc_usage = cell(1, num_qcs); % Record time-space usage for each crane

    existing_ships = []; % Store already assigned berth segments and time intervals

    for i = 1:N
        ship = ships(i);
        assigned = false;
        max_trials = min(600, 50*N); % Dynamically adjust based on number of ships
        % Try to find a conflict‑free berth and time
        for trial = 1:max_trials
            % Decode berth position
            berth_pos = round(pos(i) * (berth_length - ship.length));

            % Decode start time (cannot be earlier than arrival time)
            earliest = ship.arrival_time;
            
            if N <= 50
                max_delay = 24;
            elseif N <= 100
                max_delay = 48;
            else
                max_delay = 72;
            end
            latest = ship.arrival_time + max_delay; % Maximum allowed waiting time
            start_time = earliest + start(i) * (latest - earliest);
            start_time = round(start_time, 2);
            end_time = start_time + ship.service_time;
            berth_end = berth_pos + ship.length;

            % Check conflict with already scheduled ships
            conflict = false;
            for j = 1:size(existing_ships,1)
                other = existing_ships(j,:);
                time_overlap = ~(end_time <= other(1) || start_time >= other(2));
                space_overlap = ~(berth_end <= other(3) || berth_pos >= other(4));
                if time_overlap && space_overlap
                    conflict = true;
                    break;
                end
            end

            if ~conflict
                assigned = true;
                break; % Successfully found a non‑conflicting arrangement
            else
                % Randomly adjust and try the next combination
                pos(i) = rand; 
                start(i) = rand;
                %new_pos = rand;
                %new_start = rand;
                %pos(i) = new_pos;
                %start(i) = new_start;
                %individual(i) = new_pos;
                %individual(N+i) = new_start;

            end
        end

        if ~assigned
            % If truly infeasible, return a penalising invalid assignment (or you could set a flag and exit)
            berths(i) = berth_pos;
            start_times(i) = start_time;
            assigned_qcs{i} = [];
            continue;
        end
        %if ~assigned
            %error('Decoding failed: ship %d could not be scheduled after %d attempts', i, max_trials);
        %end

        berths(i) = berth_pos;
        start_times(i) = start_time;
        end_time = start_time + ship.service_time;
        berth_end = berth_pos + ship.length;

        % Record assigned segment
        existing_ships = [existing_ships; start_time, end_time, berth_pos, berth_end];
        %existing_ships = [existing_ships; struct('id', i, 'start', start_time, ...
         %                                'end', end_time, ...
          %                               'berth_start', berth_pos, ...
           %                              'berth_end', berth_end)];

        % --- Crane assignment ---
        qc_scores = assign((i-1)*num_qcs+1 : i*num_qcs);
        [ship_qcs, qc_usage] = assign_qcs(ship, berth_pos, start_time, end_time, ...
                                  qcs, qc_usage, qc_scores, berth_length);
        assigned_qcs{i} = ship_qcs;

    end
end