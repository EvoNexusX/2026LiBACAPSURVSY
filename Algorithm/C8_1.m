function C8_1(ship,qc,run_id,dataset_id)
    %% Set random seed
    seed = 1000 * dataset_id + 10 * run_id;
    rng(seed, 'twister');  % Independent random stream per thread
    addpath('../modules');

    %% Parameter settings
    pop_size = 50;
    max_gen = 100;
    num_scenarios = 10;

    w = 0.7;
    c1 = 1.5;
    c2 = 1.5;

    %% Read data
    [ships, qcs, berth_length] = load_data(ship, qc, 4000);
    scenarios = generate_scenarios(ships, num_scenarios);

    N = length(ships);
    num_qc = length(qcs);
    chrom_len = 2*N + N*num_qc;

    %% Initialize particle positions and velocities
    pop = rand(pop_size, chrom_len);
    vel = zeros(pop_size, chrom_len);

    fitness = zeros(pop_size,1);
    pbest = pop;
    pbest_fitness = inf(pop_size,1);

    gbest = zeros(1,chrom_len);
    gbest_fitness = inf;

    %% Main loop
    for gen = 1:max_gen
        for i = 1:pop_size
            fitness(i) = evaluate_fitness_expectation(pop(i,:), scenarios, qcs, berth_length);
            if fitness(i) < pbest_fitness(i)
                pbest(i,:) = pop(i,:);
                pbest_fitness(i) = fitness(i);
            end
            if fitness(i) < gbest_fitness
                gbest = pop(i,:);
                gbest_fitness = fitness(i);
            end
        end

        for i = 1:pop_size
            r1 = rand(1, chrom_len);
            r2 = rand(1, chrom_len);
            vel(i,:) = w*vel(i,:) + c1*r1.*(pbest(i,:) - pop(i,:)) + c2*r2.*(gbest - pop(i,:));
            pop(i,:) = pop(i,:) + vel(i,:);
            pop(i,:) = max(min(pop(i,:),1),0);
        end

        fprintf('Generation %d, Best Fitness = %.2f\n', gen, gbest_fitness);
    end

    %% Decode and output
    [berths, start_times, assigned_qcs] = decode_solution(gbest, ships, qcs, berth_length);
    %visualize_solution(berths, start_times, ships, assigned_qcs);
    % Constraint check again
    if ~check_constraints(berths, start_times, assigned_qcs, ships)
        warning('Illegal conflict exists, please debug and check!');
    else
        disp('Optimal solution is feasible.');
    end
    % Save CSV
    T = table((1:N)', berths', start_times', strings(N,1), 'VariableNames', {'Ship_ID','Berth_Position','Start_Time','Assigned_QCs'});
    for i = 1:N
        T.Assigned_QCs(i) = join(string(assigned_qcs{i}), ',');
    end
    %writetable(T, 'C8_1_result.csv');
    outname = sprintf('C8_1_result_d%d_r%d.csv', dataset_id, run_id);
    writetable(T, outname);
end