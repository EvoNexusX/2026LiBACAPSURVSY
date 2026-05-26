function test_3_flat()
    %% Add paths
    addpath('../modules');
    addpath('../GA+Min-Max鲁棒优化');
    addpath('../GA+调整性鲁棒优化');
    addpath('../GA+期望鲁棒策略');
    addpath('../PSO+Min-Max鲁棒优化');
    addpath('../PSO+调整性鲁棒优化');
    addpath('../PSO+期望鲁棒优化');
    addpath('../ACO+Min-Max鲁棒优化\');
    addpath('../ACO+期望鲁棒优化\');
    addpath("../ACO+调整性鲁棒优化\");
    %% Parameter settings
    dataset_num = 4;
    algo_names = {'C1_1','C2_1','C3_1','C4_1','C5_1','C6_1','C7_1', 'C8_1', 'C9_1'};
    %algo_names = {'C4_1','C5_1','C6_1','C7_1', 'C8_1', 'C9_1'};
    %algo_names = {'C3_1'};
    num_algorithms = length(algo_names);
    num_run = 25;

    %% Build task list: each row [dataset_id, algo_id, run_id]
    tasks = [];
    for d = 1:dataset_num
        for a = 1:num_algorithms
            for r = 1:num_run
                tasks = [tasks; d, a, r];
            end
        end
    end
    num_tasks = size(tasks, 1);

    %% Start parallel pool
    poolobj = gcp('nocreate');
    if isempty(poolobj)
        %numWorkers = min(num_tasks, feature('numcores'));
        poolobj = parpool('local', 25);
    end

    %% Fixed evaluation data
    ship_eval = readmatrix('ships_100.xlsx');
    crane_eval = readmatrix('berth_data_40.csv');
    tidalwindow = readmatrix('tidal_window_data.csv');

    %% Initialize flat result storage
    flat_results = cell(num_tasks, 1);
    flat_metrics = zeros(num_tasks, 3);  % [avg_time, robustness, runtime]
    
    %% Execute flat tasks in parallel
    parfor task_idx = 1:num_tasks
        d = tasks(task_idx, 1);
        a = tasks(task_idx, 2);
        r = tasks(task_idx, 3);

        algo_name = algo_names{a};
        ship_file = sprintf('1_%d%d.xlsx',d,d);
        crane_file = '2_40.xlsx';

        % Set unique random seed
        %seed = 1000*d + 10*a + r;
        %s = RandStream('mt19937ar','Seed',seed);
        %RandStream.setGlobalStream(s);

        fprintf('[%s - D%d - Run %d] Starting...\n', algo_name, d, r);
        t_start = tic;

        try
            feval(algo_name, ship_file, crane_file, r, d);
        catch ME
            warning('[%s-D%d-R%d] Algorithm execution failed: %s', algo_name, d, r, ME.message);
            continue;
        end

        % Read results
        result_file = sprintf('%s_result_d%d_r%d.csv', algo_name, d, r);
        if ~isfile(result_file)
            warning('[%s-D%d-R%d] Result file missing: %s', algo_name, d, r, result_file);
            continue;
        end

        T = readtable(result_file);
        V = height(T);
        solution = cell(V, 4);
        for j = 1:V
            solution{j,1} = T.Berth_Position(j);
            solution{j,2} = T.Start_Time(j);
            qc_str = T.Assigned_QCs{j};
            if isempty(qc_str)
                assigned = [];
            else
                assigned = str2num(qc_str); %#ok<ST2NM>
            end
            solution{j,3} = length(assigned);
            solution{j,4} = assigned;
        end

        % Evaluate
        [avg_time, robust_index] = benchmark(ship_eval, crane_eval, tidalwindow, 4000, solution);
        run_time = toc(t_start);

        flat_results{task_idx} = solution;
        flat_metrics(task_idx, :) = [avg_time, robust_index, run_time];

        fprintf('[%s-D%d-R%d] Completed: PortTime=%.2f, Robust=%.2f, Time=%.2fs\n', ...
            algo_name, d, r, avg_time, robust_index, run_time);
    end

    %% Reconstruct to 4D storage format
    all_results = cell(dataset_num, num_algorithms, num_run);
    all_metrics = zeros(dataset_num, num_algorithms, num_run, 3);
    for task_idx = 1:num_tasks
        d = tasks(task_idx, 1);
        a = tasks(task_idx, 2);  
        r = tasks(task_idx, 3);
        all_results{d, a, r} = flat_results{task_idx};
        all_metrics(d, a, r, :) = flat_metrics(task_idx, :);
    end

    %% Save
    save('final_experiment_results_flat_GA_ACO_PSO_100_qc.mat', 'all_results', 'all_metrics', 'algo_names');
    fprintf('\nAll tasks completed, results saved.\n');
end