clc;
fprintf(['\n------------------ ' ...
    'AC Circuits! ------------------\n']);
fprintf('0) Impedence \n');
fprintf('1) Polar to Rectangular\n');
fprintf('2) Rectangular to Polar\n');
fprintf('3) Parallel and Series\n')
fprintf('9) Return to Main Menu\n');
pickOneAgain = input(['Select what you ' ...
    'would like to do: '], 's');

if isempty(pickOneAgain) || ~all(isstrprop(pickOneAgain, ...
        'digit'))
    disp('Invalid selection...');
    pause(1.5);
    ac_menu
end

choiceAgain = str2double(pickOneAgain);
switch choiceAgain
    case 0 % impedence
        impedence
    case 1
        polar_to_rect
    case 2
        rect_to_polar
    case 3
        parallel_series_ac
    case 9
        top_ee_menu
end

