%% 4.1	Reflectance Imaging at a Single Wavelength

clear; clc; close all;

% Define the folder containing the TIFF files
folderPath = 'cubes/';

% Specify the wavelength to display
wavelength = 510; % Change this to desired wavelength

% File names for object and reference images
objectFileName = fullfile(folderPath, sprintf('metameric/Image_Cube_%d.tif', wavelength));
referenceFileName = fullfile(folderPath, sprintf('white/Image_Cube_%d.tif', wavelength));

% Read the object and reference images
objectImg = rot90(imread(objectFileName), 2);
referenceImg = rot90(imread(referenceFileName), 2);

% Calculate reflectance
% Ensure no division by zero
referenceImg(referenceImg == 0) = 1;
reflectance = double(objectImg) ./ double(referenceImg);

% Display the reflectance image
figure;
imshow(reflectance);
title(sprintf('Reflectance Image at %d nm', wavelength));

%% 4.2	Construction of RGB Images Using Selected Wavelengths

clear; clc; close all;

objectFolderPath = 'cubes/metameric/';
referenceFolderPath = 'cubes/white/';
rgbWavelengths = [450, 550, 750]; 

rgbImage = showNormalizedRGBImage(objectFolderPath, referenceFolderPath, rgbWavelengths);

figure;
imshow(rgbImage);
title('Enhanced RGB Image from Specified Wavelengths');

%% 4.3 Reflectance Spectra Analysis Across Selected Image Points
%% White reference 

clc; close all

% Load all images
numImages = 51;
sizeOfImages = [1040, 1392];
lambda = 450:10:950;
referenceFolderPath = 'cubes/white/';

% Reference Cube
referenceCube = zeros([sizeOfImages, numImages]);
for i = 1:numImages
    fileName = fullfile(referenceFolderPath, sprintf('Image_Cube_%d.tif', lambda(i)));
    referenceCube(:,:,i) = rot90(imread(fileName), 2);
end
referenceCube = referenceCube ./ max(unique(referenceCube)); % Normalization

% Define pixel coordinates for 5 points
points = [50 50; 1300 100; 1300 950; 100 950; 696 520]; % edge and center

% Plot reflectance spectra for each point
figure;
hold on;
colors = lines(size(points, 1)); % Generate distinct colors
for idx = 1:size(points, 1)
    spectra = squeeze(referenceCube(points(idx,2), points(idx,1), :));
    plot(lambda, spectra, ...
        'LineWidth', 0.75 ,...
        'Color', colors(idx,:), ...
        'LineStyle','-', ...
        'Marker','.', ...
        'MarkerSize', 8);
    ylim([0, 1]);
    % scatter(wavelengths, spectra, 50, colors(idx,:), 'filled');
end

hold off; grid on;
xlabel('Wavelength (nm)');
ylabel('Reflectance'); 
title('Reflectance Spectra at Selected Points');
legend(arrayfun(@(x) sprintf('Point (%d, %d)', points(x, 1), points(x, 2)), 1:size(points, 1), 'UniformOutput', false), 'Location', 'southeast');

% Mark points in RGB image
rgbWavelengths = [450, 550, 750];
rgbImage = showRGBImage(referenceFolderPath, rgbWavelengths);

figure();
imshow(rgbImage);
hold on;
for idx = 1:size(points, 1)
    plot(points(idx, 1), points(idx, 2), ...
        'x', ...
        'Color', colors(idx,:), ...
        'MarkerSize', 20, ...
        'LineWidth', 4);
end
% title('Selected Points on RGB Image');

%% The others
clear; clc; close all

% Load all images
numImages = 51;
sizeOfImages = [1040, 1392];
lambda = 450:10:950;

objectFolderPath = 'cubes/metameric/';
referenceFolderPath = 'cubes/white/';

% Spectral Cube
spectralCube = zeros([sizeOfImages, numImages]);
for i = 1:numImages
    fileName = fullfile(objectFolderPath, sprintf('Image_Cube_%d.tif', lambda(i)));
    spectralCube(:,:,i) = rot90(imread(fileName), 2);
end

spectralCube = spectralCube ./ max(unique(spectralCube)); % Normalization

% Reference Cube
referenceCube = zeros([sizeOfImages, numImages]);
for i = 1:numImages
    fileName = fullfile(referenceFolderPath, sprintf('Image_Cube_%d.tif', lambda(i)));
    referenceCube(:,:,i) = rot90(imread(fileName), 2);
end

referenceCube = referenceCube ./ max(unique(referenceCube)); % Normalization

% Normaliztion
% referenceCube(referenceCube == 0) = 1; % dodge zero-division
normalizedSpectralCube = double(spectralCube) ./ double(referenceCube);

% Define pixel coordinates for 5 points
% points = [255 180; 1100 600; 696 520; 230 950; 680 950]; % checher1
% points = [255 180; 1200 595; 696 520; 150 960; 770 1000]; % painting
points = [270 300; 625 300; 696 560; 1200 737; 770 1000]; % metameric

% Plot reflectance spectra for each point
figure;
hold on;
colors = lines(size(points, 1)); % Generate distinct colors
for idx = 1:size(points, 1)
    spectra = squeeze(spectralCube(points(idx,2), points(idx,1), :));
    plot(lambda, spectra, ...
        'LineWidth', 0.75 ,...
        'Color', colors(idx,:), ...
        'LineStyle','-', ...
        'Marker','.', ...
        'MarkerSize', 8);
    ylim([0, 1]);
    % scatter(wavelengths, spectra, 50, colors(idx,:), 'filled');
end
hold off; grid on;
xlabel('Wavelength (nm)');
ylabel('Reflectance');
title('Reflectance Spectra at Selected Points');
legend(arrayfun(@(x) sprintf('Point (%d, %d)', points(x, 1), points(x, 2)), 1:size(points, 1), 'UniformOutput', false), 'Location','eastoutside');

% Mark points in RGB image
rgbWavelengths = [450, 550, 750]; 
rgbImage = showNormalizedRGBImage(objectFolderPath, referenceFolderPath, rgbWavelengths);

figure;
imshow(rgbImage);
hold on;
for idx = 1:size(points, 1)
    plot(points(idx, 1), points(idx, 2), ...
        'x', ...
        'Color', colors(idx,:), ...
        'MarkerSize', 20, ...
        'LineWidth', 4);
end
title('Selected Points on RGB Image');