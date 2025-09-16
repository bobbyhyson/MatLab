clc;
fprintf(['\n------------------ ' ...
    'Op Amps ------------------\n']);
fprintf('0) Inverting Amplifier\n');
fprintf('1) Inverting Summing-Amplifier\n');
fprintf('2) Noninverting-Amplfier\n');
fprintf('3) Difference-Amplifier\n');
fprintf('4) Simplified-Difference-Amplifier\n')
fprintf('9) Return to Main Menu\n');
pickOneAgain = input(['Select what you ' ...
    'would like to do: '], 's');

if isempty(pickOneAgain) || ~all(isstrprop(pickOneAgain, ...
        'digit'))
    disp('Invalid selection...');
    pause(1.5);
end

choiceAgain = str2double(pickOneAgain);

switch choiceAgain
    case 0
        inverting_amp
    case 1
        inverting_sum
    case 2
        non_inverting
    case 3
        difference_amp
    case 9
        top_ee_menu
        
end
