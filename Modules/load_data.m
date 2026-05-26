function [ships, qcs, berth_length] = load_data(ship_file, qc_file, berth_length)
    % Read ship data without header
    ship_data = readmatrix(ship_file);
    qc_data = readmatrix(qc_file);

    % Ship structure
    for i = 1:size(ship_data,1)
        ships(i).arrival_time = ship_data(i,1);
        ships(i).length = ship_data(i,2);
        ships(i).cargo = ship_data(i,3);
        ships(i).service_time = ship_data(i,4);
        ships(i).fuel = ship_data(i,5);
        ships(i).max_qc = ship_data(i,6);
    end

    % Quay crane structure
    for j = 1:size(qc_data,1)
        qcs(j).qc_id = qc_data(j,1);
        qcs(j).available = qc_data(j,2);
    end
end