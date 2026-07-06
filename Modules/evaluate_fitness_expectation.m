% Expectation robust optimization: the objective is the average waiting time across all disturbance scenarios
function fitness = evaluate_fitness_expectation(individual, scenarios, qcs, berth_length)
    num_scenarios = size(scenarios, 1);
    total_wait = 0;

    for s = 1:num_scenarios
        ships = scenarios(s,:);
        [berths, start_times, assigned_qcs] = decode_solution(individual, ships, qcs, berth_length);
        if ~check_constraints(berths, start_times, assigned_qcs, ships)
            fitness = 1e6;
            return;
        end
        wait_times = max(0, start_times - [ships.arrival_time]);
        total_wait = total_wait + sum(wait_times);
    end

    fitness = total_wait / num_scenarios;
end
