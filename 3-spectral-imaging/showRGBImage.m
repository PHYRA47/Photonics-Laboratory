function rgbImage = showRGBImage(objectFolderPath, wavelengths)
   
    % Initialize the RGB channels
    redChannel = []; greenChannel = []; blueChannel = [];

    % Process each channel
    for idx = 1:length(wavelengths)
        % Build file names for the object and reference images for each wavelength
        objectFileName = fullfile(objectFolderPath, sprintf('Image_Cube_%d.tif', wavelengths(idx)));

        % Load images
        reflectance = rot90(imread(objectFileName), 2);

        % reflectance = reflectance / max(unique(reflectance));

        % Assign to appropriate channel based on wavelength
        if wavelengths(idx) == 450
            blueChannel = normalizeImage(reflectance);
        elseif wavelengths(idx) == 550
            greenChannel = normalizeImage(reflectance);
        elseif wavelengths(idx) == 750
            redChannel = normalizeImage(reflectance);
        end
    end

    % Create RGB image
    rgbImage = cat(3, redChannel, greenChannel, blueChannel);
end