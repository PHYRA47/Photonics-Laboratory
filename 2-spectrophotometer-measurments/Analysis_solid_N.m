clear
clc
close all
T_suppresed_wl1 = [];
T_suppresed_wl2 = [];
%% Normal Glass
% upload files
M = readmatrix('SMICROSC.txt');
% Filtering the unwanted text in the file
M(1:12,:)=[];
M(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
T = M(:,2);
% find the transmission at the suppresed wavlength 
suppresed_wl1 = find(wl==254); 
T_suppresed_wl1(1) = T(suppresed_wl1); 
suppresed_wl2 = find(wl==365); 
T_suppresed_wl2(1) = T(suppresed_wl2); 
% plotting 
figure()
plot(wl,T)
hold on 
title("Wavelegnth vs Absorbtion of Some Solid Samples")

%% Quartz glass
% upload files
M = readmatrix('SQUARTZ.txt');

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
T = M(:,2);
% find the transmission at the suppresed wavlength 
T_suppresed_wl1(2) = T(suppresed_wl1);
T_suppresed_wl2(2) = T(suppresed_wl2); 
% plotting 
plot(wl,T)
hold on 

%% Acrylic
% upload files
M = readmatrix('SACRY.txt');
% Filtering the unwanted text in the file
M(1:12,:)=[];
M(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
wl_PMMA = M(:,1);
T = M(:,2);
T_PMMA = M(:,2);
% find the transmission at the suppresed wavlength 
T_suppresed_wl1(3) = T(suppresed_wl1);
T_suppresed_wl2(3) = T(suppresed_wl2); 
% plotting 
plot(wl,T)
hold on 

%% Polycarbonate
% upload files
M = readmatrix('SPOLYC.txt');
% Filtering the unwanted text in the file
M(1:12,:)=[];
M(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
wl_PC = M(:,1);
T = M(:,2); 
T_PC = M(:,2); 
% find the transmission at the suppresed wavlength 
T_suppresed_wl1(4) = T(suppresed_wl1);
T_suppresed_wl2(4) = T(suppresed_wl2); 
% plotting 
plot(wl,T)
hold on 
grid minor

legend('Normal Glass','Quartz glass','Acrylic','Polycarbonate', 'location','south', 'Orientation','horizontal')
xlabel("Wavelength (nm)")
ylabel("Transmission")

figure();
material = ["Normal Glass", "Quartz glass", "Acrylic", "Polycarbonate"];
% Use consistent and visually distinct colors for each wavelength
scatter(categorical(material), T_suppresed_wl1, 100, 'o'); % 100 is the marker size, 'b' is blue
hold on;
scatter(categorical(material), T_suppresed_wl2, 60, 'filled','o'); % 'r' is red, 'd' is diamond shaped marker
xlabel("Material");
ylabel("Transmission");
legend('254 nm', '365 nm', 'Location', 'best', 'FontSize', 10); % Optimal legend location
title('Transmission at Suppressed Wavelengths', 'FontSize', 14, 'FontWeight', 'bold');
grid on; % Enable grid for better readability
set(gca, 'FontSize', 10); % Set axes font size
box on; % Enclose the plot in a box

% figure()
% material =["Normal Glass","Quartz glass","Acrylic","Polycarbonate"]; 
% scatter(categorical(material),T_suppresed_wl1)
% hold on 
% scatter(categorical(material),T_suppresed_wl2)
% xlabel("Material")
% ylabel("Transmission")
% legend('254 nm','365 nm')

%{
If we want to stop UV at 254 nm alone, we can use polycarbonate that has
transmission of 1e-4 at 254 nm. 
But if we want to stop both 254 nm and 365 nm, we can use Acryic that has
transmision of 0.02 for 254 nm and 0.0171 for 365 nm 
We can also use two boxs, the inner box is made of polycarbonate while
the outer box is made of Acrylic
Or we can use one box made of polycarbonate that is covered by a layar of
Acrylic
%}

T_suppresed_wl1 =[];
T_suppresed_wl2 =[];
%% Polished silicon disc
% upload files
M = readmatrix('SPOLISH.txt');

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
T = M(:,2);
% find the transmission at the suppresed wavlength 
suppresed_wl1 = find(wl==1450); 
T_suppresed_wl1(1) = T(suppresed_wl1); 
suppresed_wl2 = find(wl==1950); 
T_suppresed_wl2(1) = T(suppresed_wl2); 
% plotting 
figure
plot(wl,T)
hold on 

%% green polypropylene plastic
% upload files
M = readmatrix('SGREEN.txt');

% for plotting we need to put variables of T in wl and A
wl = M(:,1);
wl_GreenPP = M(:,1);
T = M(:,2);
T_GreenPP = M(:,2);
% find the transmission at the suppresed wavlength 
T_suppresed_wl1(2) = T(suppresed_wl1);
T_suppresed_wl2(2) = T(suppresed_wl2); 
% plotting 
plot(wl,T)

% legend('Polished silicon disc','Green polypropylene plastic','location','northwest')
% xlabel("Wavelength (nm)")
% ylabel("Transmission")

legend('Polished silicon disc', 'Green polypropylene (PP)', 'Location', 'northeast', 'FontSize', 10);
xlabel("Wavelength (nm)");
ylabel("Transmission");
title('Transmission Characteristics of Some Solids', 'FontSize', 14, 'FontWeight', 'bold');
grid minor;% Adding grid lines for better data visibility
set(gca, 'FontSize', 10); % Set font size for axes numbers
box on; % Add a box around the plot for a cleaner look


% figure()
% material =["Polished silicon disc","Green polypropylene plastic"]; 
% scatter(categorical(material),T_suppresed_wl1)
% hold on 
% scatter(categorical(material),T_suppresed_wl2)
% xlabel("Material")
% ylabel("Transmission")
% legend('1450 nm','1950 nm')

figure();
material = ["Polished silicon disc", "Green polypropylene plastic"];
% Use consistent and visually distinct colors for each wavelength
scatter(categorical(material), T_suppresed_wl1, 100, 'o'); % 100 is the marker size, 'b' is blue
hold on;
scatter(categorical(material), T_suppresed_wl2, 60, 'filled', 'o'); % 'r' is red, 'd' is diamond shaped marker
xlabel("Material");
ylabel("Transmission");
legend('1450 nm', '1950 nm', 'Location', 'best', 'FontSize', 10); % Optimal legend location
title('Transmission at Given Wavelengths', 'FontSize', 14, 'FontWeight', 'bold');
grid on; % Adding grid lines for better data visibility
set(gca, 'FontSize', 10); % Set font size for axes numbers
box on; % Add a box around the plot for a cleaner look




%Polished silicon disc is the material that works for transmitting IR and
%block visible and UV light

%%

% Convert Transmittance to Absorbance
A_PMMA = -log10(T_PMMA);
A_PC = -log10(T_PC);
A_GreenPP = -log10(T_GreenPP);

% Plotting both Transmission and Absorbance
figure();

% Subplot 1: Transmission
subplot(2, 1, 1); % Top subplot for transmission
plot(wl_PMMA, T_PMMA, 'r-'); % PMMA in red
hold on;
plot(wl_PC, T_PC, 'b-'); % PC in blue
plot(wl, T_GreenPP, 'g-'); % Green Polypropylene in green
ylabel('Transmission'); ylim([-0.1 1])
xlabel('Wavelength (nm)');
title('Transmission vs. Wavelength');
legend({'PMMA', 'PC', 'Green Polypropylene'}, 'Location', 'northoutside', 'Orientation', 'horizontal');
grid minor;
box on;

% Subplot 2: Absorbance
subplot(2, 1, 2); % Bottom subplot for absorbance
plot(wl_PMMA, abs(A_PMMA), 'r-'); % PMMA in red
hold on;
plot(wl_PC, abs(A_PC), 'b-'); % PC in blue
plot(wl, abs(A_GreenPP), 'g-'); % Green Polypropylene in green
xlabel('Wavelength (nm)');
ylabel('Absorbance'); ylim([-0.1 4.3])
title('Absorbance vs. Wavelength');
grid minor;
box on;

% Adjusting subplot spacing to prevent overlap of subplot elements
sgtitle('Transmission and Absorbance vs. Wavelength for Various Materials' ,'FontSize', 12);  % Super title for the entire figure


% % Convert Transmittance to Absorbance
% A_PMMA = -log10(T_PMMA);
% A_PC = -log10(T_PC);
% A_GreenPP = -log10(T_GreenPP);
% 
% % Plotting
% figure();
% plot(wl_PC, A_PC, 'b-', 'LineWidth', 2); % PC in blue
% hold on;
% plot(wl_PMMA, abs(A_PMMA), 'r-', 'LineWidth', 2); % PMMA in red
% plot(wl, A_GreenPP, 'g-', 'LineWidth', 2); % Green Polypropylene in green
% xlabel('Wavelength (nm)', 'FontSize', 12, 'FontWeight', 'bold');
% ylabel('Absorbance', 'FontSize', 12, 'FontWeight', 'bold');
% % title('Absorbance vs. Wavelength for Various Materials', 'FontSize', 14, 'FontWeight', 'bold');
% legend({'PMMA', 'PC', 'Green Polypropylene'}, 'Location', 'best');
% grid on;
% box on;

%% Laser Safety Glasses

filename = 'data/SLGLASS.TXT';
data = readmatrix(filename);

data(1:12,:)=[];
data(end,:)=[];

% Extract wavelength and transmittance from the data
wavelength = data(:,1); % assuming wavelength is in the first column
transmittance = data(:,2); % assuming transmittance is in the second column

% Plotting the transmittance data
figure;
plot(wavelength, transmittance, 'b-'); % 'b-' sets the line color to blue
xlabel('Wavelength (nm)');
ylabel('Transmittance');
title('Transmittance of Safety Glass vs. Wavelength','FontWeight', 'bold');
grid minor; % Adds a grid to the plot for better readability
box on; % Encloses the plot in a box for a cleaner look
legend('Laser Safety Glasses', 'Location', 'best'); % Adds a legend

% % Optionally, you can save the plot to a file
% saveas(gcf, 'SafetyGlassTransmittancePlot.png'); % Saves the figure as a PNG file

