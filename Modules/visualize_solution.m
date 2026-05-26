function visualize_solution(berths, start_times, ships, assigned_qcs)
    figure;
    hold on;
    N = length(ships);
    cmap = lines(N);
    conflict_flags = false(1, N);

    % Conflict detection
    for i = 1:N
        for j = i+1:N
            ti1 = start_times(i); te1 = ti1 + ships(i).service_time;
            ti2 = start_times(j); te2 = ti2 + ships(j).service_time;
            bi1 = berths(i); be1 = bi1 + ships(i).length;
            bi2 = berths(j); be2 = bi2 + ships(j).length;

            time_overlap = ~(te1 <= ti2 || te2 <= ti1);
            space_overlap = ~(be1 <= bi2 || be2 <= bi1);

            if time_overlap && space_overlap
                conflict_flags([i j]) = true;
            end
        end
    end

    % Plotting
    for i = 1:N
        color = cmap(i,:);
        edge = 'k';
        if conflict_flags(i)
            edge = 'r'; % Highlight conflicts in red
        end

        rectangle('Position', [start_times(i), berths(i), ships(i).service_time, ships(i).length], ...
                  'FaceColor', color, 'EdgeColor', edge, 'LineWidth', 1.5);
        
        text(start_times(i)+0.2, berths(i)+ships(i).length/2, ...
            sprintf('Ship %d\nQC: %s', i, join(string(assigned_qcs{i}), ',')), ...
            'FontSize', 7, 'Color', 'k');
    end

    xlabel('Time');
    ylabel('Berth Position');
    title('Berth & Quay Crane Assignment Visualization');
    grid on;
    hold off;

    % Conflict summary
    num_conflicts = sum(conflict_flags);
    if num_conflicts > 0
        fprintf('Visualization: %d ships have conflicts, marked with red borders.\n', num_conflicts);
    else
        disp('Visualization: No conflicts, layout is feasible.');
    end
end