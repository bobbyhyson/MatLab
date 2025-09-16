fprintf(['\n------------------ ' ...
    'Time Domain ------------------\n']);
fprintf('0) Capacitor (charging)\n');
fprintf('1) Capacitor (discharching)\n');
fprintf('2) Inductor (charging)\n');
fprintf('3) Inductor (discharging)\n');

fprintf('9) Return to Main Menu\n');
pickOneAgain = input(['Select what you ' ...
    'would like to do: '], 's');

if isempty(pickOneAgain) || ~all(isstrprop(pickOneAgain, ...
        'digit'))
    disp('Invalid selection...');
    pause(1.5);
    time_domain_menu
end

choiceAgain = str2double(pickOneAgain);

switch choiceAgain
    case 0
        capacitor_charging
    case 1
        capacitor_discharging
    case 2
        inductor_charging
    case 3
        inductor_discharging
    case 9
        top_ee_menu
end
