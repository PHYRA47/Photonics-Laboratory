function rgbImage = showNormalizedRGBImage(objectFolderPath, referenceFolderPath, wavelengths)
    % Initialize the RGB channels
    redChannel = []; greenChannel = []; blueChannel = [];

    % Process each channel
    for idx = 1:length(wavelengths)
        % Build file names for the object and reference images for each wavelength
        objectFileName = fullfile(objectFolderPath, sprintf('Image_Cube_%d.tif', wavelengths(idx)));
        referenceFileName = fullfile(referenceFolderPath, sprintf('Image_Cube_%d.tif', wavelengths(idx)));
        
        % Load images
        objectImg = rot90(imread(objectFileName), 2);
        referenceImg = rot90(imread(referenceFileName), 2);

        % Prevent division by zero in reference image
        referenceImg(referenceImg == 0) = 1;

        % Calculate reflectance
        reflectance = double(objectImg) ./ double(referenceImg);

        % Rescale the intensity of the reflectance image to the full 0-255 range (for 8-bit images)
        reflectance = imadjust(mat2gray(reflectance));

        % Assign to appropriate channel based on wavelength
        if wavelengths(idx) == 450
            blueChannel = reflectance;
        elseif wavelengths(idx) == 550
            greenChannel = reflectance;
        elseif wavelengths(idx) == 750
            redChannel = reflectance;
        end
    end

    % Create RGB image
    rgbImage = cat(3, redChannel, greenChannel, blueChannel);
end