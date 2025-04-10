
clc;

fprintf('\n ---------BOBBY''S SILLY EE MENU--------- \n');

fprintf('\n0) Polar to rectangular form\n');
fprintf('1) Rectangular to Polar\n');
fprintf('2) Multiply by 2π\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');
pickOne = input('Select what you would like to do: ');

switch pickOne
    case 1 
% Prompt user for magnitude and phase
A = input('Input Magnitude: ');  
phase = input('Input the Phase (degrees): ');  

% Convert polar to rectangular form
phasor = A * exp(1j * deg2rad(phase));  

% Display results
disp('Rectangular form:');
disp(phasor);

    case 2
        % Gather inputs 
        X = input('Input the values: \n');

        absolute = abs(X);

        degree = rad2deg(angle(X));
        %Print output
        fprintf('Phasor: %d∠%.3f°', X, degree);

    case 3
    X = input('Enter what you need to multiply: \n')
    answer = X * (2*pi);

    fprintf('Answer: %.3f', answer);

fdsafdsa
end