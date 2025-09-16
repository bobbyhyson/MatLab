clc;
fprintf(['\n------------------ Polar to ' ...
    'Rectangular Calculator ' ...
    '------------------\n']);

% Prompt user for magnitude and phase
A = input('Input Magnitude: ');
phase = input('Input the Phase (degrees): \n');
% Convert polar to rectangular form
phasor = A * exp(1j * deg2rad(phase));
% Display results
fprintf('Rectangular form: %.3f + %.3fj\n', ...
    real(phasor), imag(phasor));


again = input(['\nDo you want to ' ...
    '(c)ontinue calculating, ' ...
    '(b)ack to AC Circuits menu, ' ...
    'or (m)ain menu? '], 's');
again = lower(again);

if strcmp(again, 'c')
    polar_to_rect
elseif strcmp(again, 'b')
    ac_menu % Go back to Basics menu
elseif strcmp(again, 'm')
    top_ee_menu  % Break calculator loop
else
    disp(['Invalid input. ' ...
        'Returning to AC Circuits menu...']);
    pause(1);
    ac_menu
end

