clc;
fprintf(['\n------------------ Rectangular to ' ...
    ' ' ...
    'Polar Calculator ------------------\n']);


X = input('\nex: real + imaginaryj\n\nInput the values: \n');
absolute = abs(X);
degree = rad2deg(angle(X));
%Print output
fprintf('Phasor: %d∠%.3f°\n', absolute, degree);


again = input(['\nDo you want to ' ...
    '(c)ontinue calculating, ' ...
    '(b)ack to Basics menu, ' ...
    'or (m)ain menu? '], 's');
again = lower(again);

if strcmp(again, 'c')
    rect_to_polar
elseif strcmp(again, 'b')
    ac_menu  % Go back to Basics menu
elseif strcmp(again, 'm')
    top_ee_menu  % Break calculator loop
else
    disp(['Invalid input. ' ...
        'Returning to Basics menu...']);
    pause(1);
    ac_menu
end

