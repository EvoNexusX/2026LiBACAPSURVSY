% ==== Step 1: Read original data ====
filename = 'ships_200.xlsx';  % Change to actual file name
data = readtable(filename);       % Read entire table
T_base = table2array(data(:, 1));  % or data.Arrival if it's already numeric
num_ships = height(data);

% ==== Step 2: Parameter settings ====
sailing_time = 5;
Delta_max = 0.2 * sailing_time;

sigma = 1.0;

E_min = min(T_base) - 2;
E_max = max(T_base) + 2;

A = 3.67;
P = num_ships;
phi = pi / 4;
i = (0:num_ships-1)';

% ==== Step 3: Various perturbations ====

% 1. Uniform
delta_uniform = (2 * Delta_max) * rand(num_ships, 1) - Delta_max;
T_uniform = T_base + delta_uniform;

% 2. Gaussian
delta_gaussian = sigma * randn(num_ships, 1);
T_gaussian = T_base + delta_gaussian;

% 3. Chaotic
x = E_min + (E_max - E_min) * rand(num_ships, 1);
T_chaotic = E_min + A .* (x - E_min) .* (1 - (x - E_min) ./ (E_max - E_min));

% 4. Periodic
T_periodic = E_min + (E_max - E_min)/2 .* (sin(2 * pi * i / P + phi) + 1);

% ==== Step 4: Write four new files ====

% Helper function: replace arrival time and write
write_with_arrival(data, T_uniform, '1_111.xlsx');
write_with_arrival(data, T_gaussian, '1_222.xlsx');
write_with_arrival(data, T_chaotic, '1_333.xlsx');
write_with_arrival(data, T_periodic, '1_444.xlsx');

disp('✔ Four Excel files with different perturbations have been generated.');

% ==== Step 5: Subfunction ====
function write_with_arrival(original_table, new_arrival, filename)
    % Convert entire table to array
    T_array = table2array(original_table);
    
    % Replace the first column with perturbed arrival times
    T_array(:,1) = new_arrival;
    
    % Write to Excel without header
    writematrix(T_array, filename);
end