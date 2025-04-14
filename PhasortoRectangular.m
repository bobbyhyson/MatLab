


clc;
breakFlag = false;  % Declare it here so it's
%available globally in the loop

while true
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
        continue;
    end

    choice = str2double(pickOne);

    switch choice
        case 0  % Basic Circuit Equations
            while true
                if breakFlag
                    breakFlag = false;  % Reset it for next time
                    break;  % Exit to main menu
                end

                clc;
                fprintf(['\n------------------ ' ...
                    'Basics! ------------------\n']);
                fprintf('0) Ohm''s Law \n');
                fprintf(['1) Parallel Resistor/Inductors or Capacitors in' ...
                    ' Parallel\n']);
                fprintf('9) Return to Main Menu\n');
                pickOneAgain = input(['Select what you ' ...
                    'would like to do: '], 's');

                if isempty(pickOneAgain) || ~all(isstrprop(pickOneAgain, ...
                        'digit'))
                    disp('Invalid selection...');
                    pause(1.5);
                    continue;
                end

                choiceAgain = str2double(pickOneAgain);

                switch choiceAgain
                    case 0  % Ohm's Law Calculator
                        while true
                            clc;
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
                                continue;
                            end

                            in = upper(in);

                            if ~ismember(in, {'V', 'I', 'R'})
                                fprintf(['\nInvalid input. Please enter V, ' ...
                                    'I, or R.']);
                                pause(1.5);
                                continue;
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
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Basics menu...']);
                                pause(1);
                                break;
                            end
                        end
                    case 1
                        while true
                            clc;
                            fprintf(['\n------------------ Parallel' ...
                                ' or Series Components' ...
                                ' ------------------\n']);

                            fprintf(['ex: 10 + 20||20 = 20\nIT WILL TAKE PRIORITY OF PARALLEL' ...
                                ' FIRST ex: 10 + (20||20)\n']);
                            expr = input(['Enter your values: '], 's');

                            try
                                result = evaluateResistorExpression(expr);
                                fprintf('Answer: %.4f\n', result);
                            catch ME
                                fprintf('Error: %s\n', ME.message);
                            end



                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Basics menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Basics menu...']);
                                pause(1);
                                break;
                            end
                        end


                    case 9
                        break;  % Back to main menu




                    otherwise
                        disp('Invalid selection...');
                        pause(1.5);
                end
            end  % end Basics menu loop

        case 1 %AC Circuits Menu
            while true
                if breakFlag
                    breakFlag = false;  % Reset it for next time
                    break;  % Exit to main menu
                end

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
                    continue;
                end

                choiceAgain = str2double(pickOneAgain);
                switch choiceAgain
                    case 0
                        while true
                            clc;
                            fprintf(['\n------------------ Impedence ' ...
                                ' ' ...
                                'Calculator ------------------\n']);
                            decision = input(['Pick from the following:\n' ...
                                'Calculating for:\nL) Inductor\nC) Capacitor\n> '], 's');

                            if isempty(decision)
                                disp('Invalid selection. Please enter L or C.');
                                pause(1.5);
                                continue;
                            end

                            decision = upper(decision);

                            switch decision
                                case 'L'
                                    om = input('Enter ω (angular frequency): ');
                                    L = input('Enter L (inductance in H): ');
                                    Z = 1j * om * L;
                                    fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n' ...
                                        , real(Z), imag(Z));

                                case 'C'
                                    om = input('Enter ω (angular frequency): ');
                                    C = input('Enter C (capacitance in F): ');
                                    Z = -1j / (om * C);
                                    fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n' ...
                                        , real(Z), imag(Z));

                                otherwise
                                    disp('Invalid selection. Please enter L or C.');
                            end



                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to AC Circuits menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to AC Circuits menu...']);
                                pause(1);
                                break;
                            end
                        end

                    case 1
                        while true
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
                            fprintf('Rectangular form: %.3f + %.3fj\n', real(phasor), imag(phasor));


                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to AC Circuits menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to AC Circuits menu...']);
                                pause(1);
                                break;
                            end
                        end
                    case 2


                        while true
                            clc;
                            fprintf(['\n------------------ Rectangular to ' ...
                                ' ' ...
                                'Polar Calculator ------------------\n']);


                            X = input('\nex: real + imaginaryj\n\nInput the values: \n');
                            absolute = abs(X);
                            degree = rad2deg(angle(X));
                            %Print output
                            fprintf('Phasor: %d∠%.3f°\n', X, degree);


                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Basics menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Basics menu...']);
                                pause(1);
                                break;
                            end
                        end
                    case 3

                        while true
                            clc;
                            fprintf(['\n------------------ Parallel and' ...
                                ' ' ...
                                ' Series ------------------\n']);

                            fprintf(['ex: 10 + 20||20 = 20\nIT WILL TAKE PRIORITY OF PARALLEL' ...
                                ' FIRST ex: 10 + (20||20)\n']);
                            expr = input(['Enter your values: '], 's');

                            try
                                result = evaluateResistorExpression(expr);
                                fprintf('Answer: %.4f\n', result);
                            catch ME
                                fprintf('Error: %s\n', ME.message);
                            end


                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Basics menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Basics menu...']);
                                pause(1);
                                break;
                            end
                        end


                    case 9


                        break;  % Back to main menu


                    otherwise

                        disp('Invalid selection...');

                        pause(1.5);


                end
            end  % end AC Circuits menu loop
        case 2
            while true
                if breakFlag
                    breakFlag = false;  % Reset it for next time
                    break;  % Exit to main menu
                end

                clc;
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
                    continue;
                end

                choiceAgain = str2double(pickOneAgain);

                switch choiceAgain
                    case 0
                        while true
                            clc;
                            fprintf(['\n------------------ Capacitor' ...
                                ' ' ...
                                ' Charging Calculator ------------------\n']);
                            Vol = input('Input V0: ');
                            Res = input('Input R: ');
                            Cap = input('Input C: ');
                            tim = input('Input t: ');

                            timeDomain = (Vol*(1-(exp((-tim/(Res*Cap))))));
                            fprintf('\nV(t) = %.3f', timeDomain);

                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Time Domain menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Time Domain menu...']);
                                pause(1);
                                break;
                            end
                        end

                    case 1
                        while true
                            clc;
                            fprintf(['\n------------------ Capacitor' ...
                                ' ' ...
                                ' Discharging Calculator ------------------\n']);
                            Vol = input('Input V0: ');
                            Res = input('Input R: ');
                            Cap = input('Input C: ');
                            tim = input('Input t: ');

                            timeDomain = (Vol*(exp((-tim/(Res*Cap)))));
                            fprintf('\nV(t) = %.3f', timeDomain);

                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Time Domain menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Time Domain menu...']);
                                pause(1);
                                break;
                            end
                        end
                    case 2
                        while true
                            clc;
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
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Time Domain menu...']);
                                pause(1);
                                break;
                            end
                        end
                    case 3
                        while true
                            clc;
                            fprintf(['\n------------------ Inductor' ...
                                ' ' ...
                                ' Discharging Calculator ------------------\n']);
                            Amp = input('Input I0: ');
                            Res = input('Input R: ');
                            Cap = input('Input C: ');
                            tim = input('Input t: ');

                            timeDomain = (Amp*(exp((-tim/(Res*Cap)))));
                            fprintf('\nV(t) = %.3f', timeDomain);

                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Time Domain menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Time Domain menu...']);
                                pause(1);
                                break;
                            end
                        end





                    case 9


                        break;  % Back to main menu


                    otherwise

                        disp('Invalid selection...');

                        pause(1.5);


                end
            end  % end Time Domain menu loop

        case 3
            while true
                if breakFlag
                    breakFlag = false;  % Reset it for next time
                    break;  % Exit to main menu
                end

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
                    continue;
                end

                choiceAgain = str2double(pickOneAgain);

                switch choiceAgain

                    case 0
                        while true
                            clc;
                            fprintf(['\n------------------ Inverting Amplifier ' ...
                                'Calculator ------------------\n']);
                            fprintf('Enter known values (leave unknowns blank):\n');

                            Vo = input('Vo (output voltage) = ');
                            Vi = input('Vs (input voltage) = ');
                            Rf = input('Rf (feedback resistor in ohms) = ');
                            Rin = input('Rin (input resistor in ohms) = ');

                            knownVars = struct();
                            if ~isempty(Vo), knownVars.Vo = Vo; end
                            if ~isempty(Vi), knownVars.Vi = Vi; end
                            if ~isempty(Rf), knownVars.Rf = Rf; end
                            if ~isempty(Rin), knownVars.Rin = Rin; end

                            try
                                result = opamp_solver('inverting', knownVars);
                                disp('--- Solved Value ---');
                                disp(result);
                            catch err
                                disp('Could not solve equation:');
                                disp(err.message);
                            end

                            pause;
                            again = input(['\nDo you want to ' ...
                                '(c)ontinue calculating, ' ...
                                '(b)ack to Basics menu, ' ...
                                'or (m)ain menu? '], 's');
                            again = lower(again);

                            if strcmp(again, 'c')
                                continue;
                            elseif strcmp(again, 'b')
                                break;  % Go back to Basics menu
                            elseif strcmp(again, 'm')
                                breakFlag = true;
                                break;  % Break calculator loop
                            else
                                disp(['Invalid input. ' ...
                                    'Returning to Basics menu...']);
                                pause(1);
                                break;
                            end
                        end

                    case 9


                        break;  % Back to main menu


                    otherwise

                        disp('Invalid selection...');

                        pause(1.5);


                end
            end  % end Op Amps menu loop

        case 9
            fprintf('Exiting...\n\n\n');
            break;  % Exit program

        otherwise
            disp('Invalid selection...');
            pause(1.5);
    end %end of main menu
end





%PARALLEL AND RESISTOR FUNCTION


function result = evaluateResistorExpression(expr)
% Define operator precedence
precedence = containers.Map({'||', '+'}, [2, 1]);

% Tokenize the expression
tokens = regexp(expr, '\d+(\.\d+)?|[\+\(\)]|(\|\|)', 'match');

% Convert infix to postfix using Shunting Yard algorithm
outputQueue = {};
operatorStack = {};

for i = 1:length(tokens)
    token = tokens{i};
    if ~isempty(regexp(token, '^\d+(\.\d+)?$', 'once'))
        outputQueue{end+1} = token;
    elseif isKey(precedence, token)
        while ~isempty(operatorStack) && isKey(precedence, operatorStack{end}) && ...
                precedence(operatorStack{end}) >= precedence(token)
            outputQueue{end+1} = operatorStack{end};
            operatorStack(end) = [];
        end
        operatorStack{end+1} = token;
    elseif strcmp(token, '(')
        operatorStack{end+1} = token;
    elseif strcmp(token, ')')
        while ~isempty(operatorStack) && ~strcmp(operatorStack{end}, '(')
            outputQueue{end+1} = operatorStack{end};
            operatorStack(end) = [];
        end
        if isempty(operatorStack)
            error('Mismatched parentheses');
        end
        operatorStack(end) = []; % Remove '('
    end
end

while ~isempty(operatorStack)
    if any(strcmp(operatorStack{end}, {'(', ')'}))
        error('Mismatched parentheses');
    end
    outputQueue{end+1} = operatorStack{end};
    operatorStack(end) = [];
end

% Evaluate the postfix expression
stack = [];
for i = 1:length(outputQueue)
    token = outputQueue{i};
    if ~isempty(regexp(token, '^\d+(\.\d+)?$', 'once'))
        stack(end+1) = str2double(token);
    else
        b = stack(end); stack(end) = [];
        a = stack(end); stack(end) = [];
        if strcmp(token, '+')
            stack(end+1) = a + b;
        elseif strcmp(token, '||')
            stack(end+1) = 1 / (1/a + 1/b);
        else
            error('Unknown operator: %s', token);
        end
    end
end

if length(stack) ~= 1
    error('Invalid expression');
end

result = stack(1);
end


%Op Amps

function result = opamp_solver(configType, knownVars)
switch lower(configType)
    case 'inverting'
        result = solve_inverting(knownVars);
        % Add more cases for other op amp types
    otherwise
        error('Unknown op amp configuration.');
end
end


function result = solve_inverting(vars)
syms Vo Vi Rf Rin

eq = Vo == -Rf / Rin * Vi;

% Substitute known values
fields = fieldnames(vars);
for i = 1:length(fields)
    eq = subs(eq, sym(fields{i}), vars.(fields{i}));
end

unknowns = setdiff({'Vo','Vi','Rf','Rin'}, fields);
if length(unknowns) ~= 1
    error('You must provide exactly three known variables.');
end

sol = solve(eq, sym(unknowns{1}));
result.(unknowns{1}) = double(sol);
end



%Template

                        % 
                        % while true
                        %     clc;
                        %     fprintf(['\n------------------ ' ...
                        %         ' ' ...
                        %         '------------------\n']);
                        % 
                        % 
                        %     again = input(['\nDo you want to ' ...
                        %         '(c)ontinue calculating, ' ...
                        %                    '(b)ack to Basics menu, ' ...
                        %                    'or (m)ain menu? '], 's');
                        %     again = lower(again);
                        % 
                        %     if strcmp(again, 'c')
                        %         continue;
                        %     elseif strcmp(again, 'b')
                        %         break;  % Go back to Basics menu
                        %     elseif strcmp(again, 'm')
                        %         breakFlag = true;
                        %         break;  % Break calculator loop
                        %     else
                        %         disp(['Invalid input. ' ...
                        %             'Returning to Basics menu...']);
                        %         pause(1);
                        %         break;
                        %     end
                        % end
