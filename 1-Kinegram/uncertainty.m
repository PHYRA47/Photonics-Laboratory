% Given values
m = -1;
theta_0 = 25 * pi / 180; % Converting degrees to radians
alpha = 25.33 * pi / 180; % Converting degrees to radians
delta_lambda = 0.1;
delta_theta_0 = 0.5 * pi / 180; % Converting degrees to radians
delta_alpha = 0.5 * pi / 180; % Converting degrees to radians

% Equation for Delta_f
Delta_f = sqrt( ...
    ((m / (sin(theta_0 - alpha) - sin(theta_0 + alpha))) * delta_lambda)^2 + ...
    (((m * cos(theta_0 - alpha) + m * cos(theta_0 + alpha)) / (sin(theta_0 - alpha) - sin(theta_0 + alpha))^2) * delta_theta_0)^2 + ...
    (((-m * cos(theta_0 - alpha) + m * cos(theta_0 + alpha)) / (sin(theta_0 - alpha) - sin(theta_0 + alpha))^2) * delta_alpha)^2 ...
);

% Display the result
disp(['Delta_f = ', num2str(Delta_f)]);
