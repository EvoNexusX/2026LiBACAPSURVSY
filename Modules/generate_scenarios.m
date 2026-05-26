function scenarios = generate_scenarios(ships, num_scenarios)
    scenarios = repmat(ships, num_scenarios, 1);
    for s = 1:num_scenarios
        for i = 1:length(ships)
            % Arrival time perturbation (normal distribution, standard deviation 10% of mean)
            mu_arrival = ships(i).arrival_time;
            sigma_arrival = 0.1 * mu_arrival;
            scenarios(s,i).arrival_time = max(0, mu_arrival + sigma_arrival * randn);
            
            % Ship length perturbation (normal distribution, standard deviation 5% of mean)
            mu_length = ships(i).length;
            sigma_length = 0.05 * mu_length;
            scenarios(s,i).length = max(50, mu_length + sigma_length * randn);
        end
    end
end