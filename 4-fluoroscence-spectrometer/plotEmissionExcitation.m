function plotEmissionExcitation(path, numeric, title_str)
    % Construct the filename
    filename = fullfile(path, strcat('Administrator', {' '}, int2str(numeric), '.CSV'));

    % Preprocess the CSV file and store the data in a table
    table = preProcessCSV(filename);

    % % Extract emission and excitation wavelengths
    % lambda_em = table(1, 2:end);
    % lambda_ex = table(2:end, 1)';
    % 
    % % Extract the data matrix
    % data = table(2:end, 2:end);

    % Extract emission and excitation wavelengths
    lambda_ex = table(1, 2:end) ; % x
    lambda_em = table(2:end, 1)'; % y

    % Extract the data matrix
    data = flipud(table(2:end, 2:end));

    % Create a pseudocolor plot (the orders are changed and data transposed)
    pcolor(lambda_ex, lambda_em, data);
    shading interp;

    % Label the axes
    xlabel('Excitation Wavelength (nm)');
    ylabel('Emission Wavelength (nm)');

    % Add a colorbar
    colorbar;

    % Set the title of the plot
    title(title_str);

    % Enhance visibility by adjusting the colormap and color limits
    colormap("jet"); % Use the 'jet' colormap
    clim([min(data(:)), max(data(:))]); % Adjust the color limits
    colorbar; % Add a colorbar
end