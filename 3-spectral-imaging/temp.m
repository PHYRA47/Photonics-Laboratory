clear; clc; close all;

% Define the folder containing the TIFF files
folderPath = 'cubes/checker2/';

% Specify the wavelength to display
wavelength = 510; % change this to desired wavelength
fileName = fullfile(folderPath, sprintf('Image_Cube_%d.tif', wavelength));
img = imread(fileName);

% Flip the image upside down
img_flipped = rot90(img,2);

% Display the flipped image
figure;
imshow(img_flipped, []);
% title(sprintf('Reflectance Image at %d nm', wavelength));

%%

% clear; clc; close all;
% 
% % Define the folder containing the TIFF files
% folderPath = 'cubes/';
% 
% % Specify the wavelength to display
% wavelength = 510; % Change this to desired wavelength
% 
% % File names for object and reference images
% objectFileName = fullfile(folderPath, sprintf('painting/Image_Cube_%d.tif', wavelength));
% referenceFileName = fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelength));
% 
% % Read the object and reference images
% objectImg = flipud(imread(objectFileName));
% referenceImg = flipud(imread(referenceFileName));
% 
% % Calculate reflectance
% % Ensure no division by zero
% % referenceImg(referenceImg == 0) = 1;
% reflectance = double(objectImg) ./ double(referenceImg);
% 
% % Display the reflectance image
% figure;
% imshow(reflectance, []);
% title(sprintf('Reflectance Image at %d nm', wavelength));

%%

clear; clc; % close all;

% Define the folder containing the TIFF files
folderPath = 'cubes/checker1/';

% Define wavelengths for RGB channels
wavelengths = [450, 550, 750]; % blue, green, red channels

% Load and stack the three images
redChannel = imread(fullfile(folderPath, sprintf('Image_Cube_%d.tif', wavelengths(3))));
greenChannel = imread(fullfile(folderPath, sprintf('Image_Cube_%d.tif', wavelengths(2))));
blueChannel = imread(fullfile(folderPath, sprintf('Image_Cube_%d.tif', wavelengths(1))));

% Rescale the intensity of each channel to the full 0-255 range (for 8-bit images)
redChannel = imadjust(redChannel);
greenChannel = imadjust(greenChannel);
blueChannel = imadjust(blueChannel);

% Create RGB image
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
figure;
imshow(rgbImage);
title('Enhanced RGB Image from Specified Wavelengths');

%%

clear; clc; close all;

% Define the folder containing the TIFF files
folderPath = 'cubes/';

% Define wavelengths for RGB channels
wavelengths = [450, 550, 750]; % blue, green, red channels

% Initialize the RGB channels
redChannel = [];
greenChannel = [];
blueChannel = [];

% Process each channel
for idx = 1:length(wavelengths)
    % Read the object and reference images for each wavelength
    objectFileName = fullfile(folderPath, sprintf('checker2/Image_Cube_%d.tif', wavelengths(idx)));
    referenceFileName = fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelengths(idx)));
    objectImg = rot90(imread(objectFileName), 2);
    referenceImg = rot90(imread(referenceFileName), 2);

    % Prevent division by zero in reference image
    referenceImg(referenceImg == 0) = 1;

    % Calculate reflectance
    reflectance = double(objectImg) ./ double(referenceImg);

    % Rescale the intensity of the reflectance image to the full 0-255 range (for 8-bit images)
    reflectance = imadjust(mat2gray(reflectance));

    % Assign to appropriate channel
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
figure;
imshow(rgbImage);
%title('Enhanced RGB Image from Specified Wavelengths');

%%
% 
% clear; clc; close all;
% 
% % Define the folder containing the TIFF files
% folderPath = 'cubes/';
% 
% % Define wavelengths for RGB channels
% wavelengths = [450, 550, 750]; % blue, green, red channels
% 
% % Load and normalize each image channel against its reference
% blueChannel = imread(fullfile(folderPath, sprintf('checker1/Image_Cube_%d.tif', wavelengths(1))));
% blueRef = imread(fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelengths(1))));
% blueChannel = double(blueChannel) ./ double(blueRef);
% blueChannel(blueRef == 0) = 0; % Avoid division by zero
% blueChannel = imadjust(mat2gray(blueChannel));  % Normalize and scale to 0-1 then adjust contrast
% 
% greenChannel = imread(fullfile(folderPath, sprintf('checker1/Image_Cube_%d.tif', wavelengths(2))));
% greenRef = imread(fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelengths(2))));
% greenChannel = double(greenChannel) ./ double(greenRef);
% greenChannel(greenRef == 0) = 0; % Avoid division by zero
% greenChannel = imadjust(mat2gray(greenChannel));  % Normalize and scale to 0-1 then adjust contrast
% 
% redChannel = imread(fullfile(folderPath, sprintf('checker1/Image_Cube_%d.tif', wavelengths(3))));
% redRef = imread(fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelengths(3))));
% redChannel = double(redChannel) ./ double(redRef);
% redChannel(redRef == 0) = 0; % Avoid division by zero
% redChannel = imadjust(mat2gray(redChannel));  % Normalize and scale to 0-1 then adjust contrast
% 
% % Create RGB image
% rgbImage = cat(3, redChannel, greenChannel, blueChannel);
% figure;
% imshow(rgbImage);
% title('Enhanced RGB Image from Specified Wavelengths');


%%
% Load all images
numImages = 51;
allImages = zeros([size(img), numImages]);
wavelengths = 450:10:950;

for i = 1:numImages
    fileName = fullfile(folderPath, sprintf('Image_Cube_%d.tif', wavelengths(i)));
    allImages(:,:,i) = imread(fileName);
end

% Define pixel coordinates for 5 points
points = [100 150; 200 250; 300 350; 400 450; 500 550]; % Update with actual coordinates

% Plot reflectance spectra for each point
figure;
hold on;
colors = lines(size(points, 1)); % Generate distinct colors
for idx = 1:size(points, 1)
    spectra = squeeze(allImages(points(idx,2), points(idx,1), :));
    plot(wavelengths, spectra, 'Color', colors(idx,:), 'LineWidth', 2);
    scatter(wavelengths, spectra, 50, colors(idx,:), 'filled');
end
hold off;
xlabel('Wavelength (nm)');
ylabel('Reflectance');
title('Reflectance Spectra at Selected Points');
legend(arrayfun(@(x) sprintf('Point %d', x), 1:size(points, 1), 'UniformOutput', false));

% Mark points in RGB image
figure;
imshow(rgbImage);
hold on;
for idx = 1:size(points, 1)
    plot(points(idx, 1), points(idx, 2), 'o', 'Color', colors(idx,:), 'MarkerSize', 10, 'LineWidth', 2);
end
title('Selected Points on RGB Image');

