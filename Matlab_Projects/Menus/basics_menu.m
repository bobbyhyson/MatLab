
    clc;
    fprintf(['\n------------------ ' ...
        'Basics! ------------------\n']);
    fprintf('0) Ohm''s Law \n');
    fprintf(['1) Parallel Resistor/Inductors or Capacitors in' ...
        ' Parallel\n']);
    fprintf('9) Return to Main Menu\n');
    pickOneBasics = input('Select what you would like to do: ', 's');

    if isempty(pickOneBasics) || ~all(isstrprop(pickOneBasics, 'digit'))
        disp('Invalid selection...');
        pause(1.5);
        basics_menu
    end
    choiceBasics = str2double(pickOneBasics);

    switch choiceBasics
        case 0  % Ohm's Law Calculator
            ohms_solver
        case 1
            parallel_series
        case 9
            top_ee_menu
    end
