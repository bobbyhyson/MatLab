                            
fprintf(['\n------------------ Ohm''s ' ...
    'Law Calculator! ------------------\n']);
fprintf(['Input the values below, if unknown' ...
    ' press enter.']);
V = input('\nInput voltage: ');
I = input('Input current: ');
R = input('Input resistance: ');

in = input(['What do you want to calculate?\n' ...
    'V) Voltage\n' ...
    'I) Current\n' ...
    'R) Resistance\n> '], 's');

if isempty(in)
    disp(['Invalid input. Please enter V, ' ...
        'I, or R.']);
    pause(1.5);
end

in = upper(in);

if ~ismember(in, {'V', 'I', 'R'})
    fprintf(['\nInvalid input. Please enter V, ' ...
        'I, or R.']);
    pause(1.5);
end

% Perform calculation
switch in
    case 'V'
        V = I * R;
        fprintf(['\nVoltage (V) = %.2f ' ...
            'volts\n'], V);
        clear V;
    case 'I'
        I = V / R;
        fprintf(['\nCurrent (I) = ' ...
            '%.2f amps\n'], I);
        clear I;
    case 'R'
        R = V / I;
        fprintf(['\nResistance (R) = ' ...
            '%.2f ohms\n'], R);
        clear R;
end

again = input(['\nDo you want to ' ...
    '(c)ontinue calculating, ' ...
    '(b)ack to Basics menu, ' ...
    'or (m)ain menu? '], 's');
again = lower(again);

if strcmp(again, 'c')
    ohms_solver
elseif strcmp(again, 'b')
    basics_menu
elseif strcmp(again, 'm')
    breakFlag = true;
    top_ee_menu
else
    disp(['Invalid input. ' ...
        'Returning to Basics menu...']);
    pause(1);
    basics_menu
end

