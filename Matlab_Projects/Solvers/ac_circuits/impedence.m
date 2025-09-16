clc;
fprintf(['\n------------------ Impedence ' ...
    ' ' ...
    'Calculator ------------------\n']);
decision = input(['Pick from the following:\n' ...
    'Calculating for:\nL) Inductor\nC) C' ...
    'apacitor\n> '], 's');

if isempty(decision)
    disp(['Invalid selection. Please enter ' ...
        'L or C.']);
    pause(1.5);
end

decision = upper(decision);

switch decision
    case 'L'
        om = input(['Enter ω (angular ' ...
            'frequency): ']);
        L = input('Enter L (inductance in H): ');
        Z = 1j * om * L;
        fprintf('Impedance (Z) = %.3f + .3fj Ohms\n', real(Z), imag(Z));

    case 'C'
        om = input(['Enter ω (angular ' ...
            'frequency): ']);
        C = input(['Enter C (capacitance ' ...
            'in F): ']);
        Z = -1j / (om * C);
        fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n' ...
            , real(Z), imag(Z));

    otherwise
        disp(['Invalid selection. ' ...
            'Please enter L or C.']);
end



again = input(['\nDo you want to ' ...
    '(c)ontinue calculating, ' ...
    '(b)ack to AC Circuits menu, ' ...
    'or (m)ain menu? '], 's');
again = lower(again);

if strcmp(again, 'c')
    impedence
elseif strcmp(again, 'b')
    ac_menu % Go back to AC menu
elseif strcmp(again, 'm')
    top_ee_menu
else
    disp(['Invalid input. ' ...
        'Returning to AC Circuits menu...']);
    pause(1);
    ac_menu
end

