
clear 
clc

Max_A = [];

%% O%
% upload files
T = readmatrix('data/LW0.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A(1) = max(A_new);

% plotting 
figure()
plot(wl,A)
hold on 
grid minor
title("Wavelegnth vs Absorbtion of liquid samples")


%% O.5%
% upload files
T = readmatrix('data/LW005.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A(2) = max(A_new);

% plotting 
plot(wl,A)
hold on 

%% 1%
% upload files
T = readmatrix('data/LW1.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A(3) = max(A_new);

% plotting 
plot(wl,A)
hold on 


%% 1.5%
% upload files
T = readmatrix('data/LW15.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A(4) = max(A_new);

% plotting 
plot(wl,A)
hold on 


%% 2%
% upload files
T = readmatrix('data/LW020.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A(5) = max(A_new);

% plotting 
plot(wl,A)
hold on 

%% Unknown concentration 

% upload files
T = readmatrix('data/LWUNKNOW.TXT');
% Filtering the unwanted text in the file
T(1:12,:)=[];
T(end,:)=[];

% for plotting we need to put variables of T in wl and A
wl = T(:,1);
A = T(:,2);

% Now we need to filter the curves we have so that we can find the max
% absorbtion in the range that can works
wl_indx1 = find(wl==350);
wl_indx2 = find(wl==450);
A_new = A(wl_indx1:wl_indx2);
Max_A_Unknown= max(A_new);
plot(wl,A)
legend('0%','0.5%','1%','1.5%','2%','unknown conc')
xlabel("Wavelength (nm)")
ylabel("Absorbtion")

conc = [0 0.5 1 1.5 2];

% Assuming Max_A is an array containing the maximum absorption for each concentration
% and Max_A_Unknown is the maximum absorption of the unknown concentration.

%Fitting the data
p = polyfit(conc, Max_A, 1);
y_fit = polyval(p, conc); % Generate y values using the fitted parameters

% Equation as a string
eqn_str = sprintf('y = %.2fx + %.2f', p(1), p(2));

% Plotting
figure();
scatter(Max_A, conc, 'filled'); % Measured data as scatter points
hold on; grid minor; box on
plot(y_fit, conc, 'r-', 'LineWidth', 2); % Fitted data as a solid line
xlabel('Absorption');
ylabel('Concentration (%)');
legend('Measured data', 'Fitted data');
title('Concentration vs. Absorption');

% Adding the equation to the plot
text(max(Max_A)-0.4, max(conc) -0.1, eqn_str, 'FontSize', 12);

% Ensure the legend does not cover the fitted line or the data points
legend('Location','southeast')




% Finidng the unknown conc
unknown_conc = (Max_A_Unknown-p(2))/p(1)