% evaluate_fitness_adjustable.m
% Adjustable RO: primary decisions are berth and time, cranes are adjustable, objective is expected waiting time
function fitness = evaluate_fitness_adjustable(individual, scenarios, qcs, berth_length)
    num_scenarios = size(scenarios, 1);
    total_wait = 0;

    % Step 1: Extract primary decisions (berth positions and start times)
    N = length(scenarios(1,:));
    pos_and_time = individual(1:2*N); % First 2N elements are the primary decisions

    for s = 1:num_scenarios
        ships = scenarios(s,:);
        temp_individual = [pos_and_time, rand(1, N * length(qcs))];
        [berths, start_times, assigned_qcs] = decode_solution(temp_individual, ships, qcs, berth_length);
        if ~check_constraints(berths, start_times, assigned_qcs, ships)
            fitness = 1e6;
            return;
        end
        wait_times = max(0, start_times - [ships.arrival_time]);
        total_wait = total_wait + sum(wait_times);
    end

    fitness = total_wait / num_scenarios;
end