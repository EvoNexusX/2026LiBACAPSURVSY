function [fitness, worst_scenario] = evaluate_fitness_minmax(individual, scenarios, qcs, berth_length)
    num_scenarios = size(scenarios, 1);
    max_wait_time = -inf;
    worst_scenario = scenarios(1,:);  % Initialization

    for s = 1:num_scenarios
        ships = scenarios(s,:);
        [berths, start_times, assigned_qcs] = decode_solution(individual, ships, qcs, berth_length);
        
        if ~check_constraints(berths, start_times, assigned_qcs, ships)
            fitness = 1e6;
            worst_scenario = ships;
            return;
        end

        wait_times = max(0, start_times - [ships.arrival_time]);
        scenario_wait = max(wait_times);
        
        if scenario_wait > max_wait_time
            max_wait_time = scenario_wait;
            worst_scenario = ships;  % Record the perturbation scenario that causes the maximum waiting time
        end
    end

    fitness = max_wait_time;
end