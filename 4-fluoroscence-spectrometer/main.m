%% 
clear, clc, close all

path = "data/greenYellow290/"; numeric = 1499;
filename = fullfile(path, strcat('Administrator', {' '}, int2str(numeric), '.CSV'));

table = preProcessCSV(filename);

lambda_ex = table(1, 2:end) ; % x
lambda_em = table(2:end, 1)'; % y

%% Task 1

data = flipud(table(2:end, 2:end));

figure()
pcolor(lambda_ex, lambda_em, data);
shading interp
xlabel('Excitation Wavelength (nm)');
ylabel('Emission Wavelength (nm)');
colorbar

title('Green-Yellow Sample');

% % Enhancing visibility by adjusting the colormap and color limits
% colormap("jet"); % Example: using the 'jet' colormap
% clim([min(data(:)), max(data(:))]); % Adjust the color limits
% colorbar;

%% Task 2

load spectra.mat % A and D65

wavelength = 380:10:780;

% Plot the spectra of CIE A and CIE D65
figure;
plot(lambda_ex, A, 'b', lambda_ex, D65, 'r', 'LineWidth', 1.5); grid on
ylabel('Intensity (a.u.)');
xlabel('Wavelength (nm)');
legend('CIE A', 'CIE D65', 'Location', 'northwest');
title('Spectral Distribution of CIE A and CIE D65');

% Selected Donaldson
i = 1;
D = zeros(size(lambda_ex, 1), 42);

for lambda = wavelength
    idx = find(table(:, 1) == lambda);
    if ~isempty(idx)
        D(i, :) = table(idx, :);
        i = i + 1;
    end
end

Ddata = D(:, 2:end); Dlambda = D(:, 1);

emissionSpectrumA = Ddata * A;
emissionSpectrumD65 = Ddata * D65;

figure;
plot(Dlambda, emissionSpectrumA, 'b', Dlambda, emissionSpectrumD65, 'r', 'LineWidth', 1.5); grid on
ylabel('Intensity (a.u.)');
xlabel('Wavelength (nm)');
legend('CIE A', 'CIE D65', 'Location', 'northwest');
title('Emission Spectra by CIE A and CIE D65');



