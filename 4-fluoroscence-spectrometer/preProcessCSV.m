function table = preProcessCSV(input_path)
    % Read CSV file
    data = readtable(input_path, 'Delimiter', ';', 'VariableNamingRule', 'preserve');

    % Convert decimal separator from comma to dot
    for i = 1:width(data)
        if iscell(data{:, i})
            % Convert strings with commas to numbers with periods
            data{:, i} = strrep(data{:, i}, ',', '.');
        end
        % Convert the entire column to numeric where possible
        data.(i) = str2double(data.(i));
    end

    % Convert table to matrix
    matrix_data = table2array(data);

    % Add the header row
    header_row = [NaN, 300:10:700];
    table = [header_row; matrix_data];
end
