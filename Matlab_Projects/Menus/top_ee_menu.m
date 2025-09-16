clc;


clc;
fprintf(['\n------------------ BOBBY''S SILLY ' ...
    'EE MENU ------------------']);
fprintf('\n0) Basic Circuit Equations\n');
fprintf('1) AC Circuit Equations\n');
fprintf('2) Time Domain\n');
fprintf('3) Op Amps\n');
fprintf('9) To exit\n');  % Exit option only
pickOne = input('Select what you would like to do: ', 's');

if isempty(pickOne) || ~all(isstrprop(pickOne, 'digit'))
    disp('Invalid selection...');
    pause(1.5);
    top_ee_menu
end
choice = str2double(pickOne);

switch choice
    case 0  % Basic Circuit Equations
        basics_menu
    case 1
        ac_menu
    case 2
        time_domain_menu
    case 3 
        op_amps_menu

end
