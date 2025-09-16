fprintf(['\n------------------ Inductor' ...
    ' ' ...
    ' Charging Calculator ------------------\n']);
Amp = input('Input I0: ');
Res = input('Input R: ');
Cap = input('Input C: ');
tim = input('Input t: ');

timeDomain = (Amp*(1-(exp((-tim/(Res*Cap))))));
fprintf('\nV(t) = %.3f', timeDomain);

again = input(['\nDo you want to ' ...
    '(c)ontinue calculating, ' ...
    '(b)ack to Time Domain menu, ' ...
    'or (m)ain menu? '], 's');
again = lower(again);

if strcmp(again, 'c')
    inductor_charging
elseif strcmp(again, 'b')
    time_domain_menu  % Go back to Basics menu
elseif strcmp(again, 'm')
    top_ee_menu  % Break calculator loop
else
    disp(['Invalid input. ' ...
        'Returning to Time Domain menu...']);
    pause(1);
    time_domain_menu
end
