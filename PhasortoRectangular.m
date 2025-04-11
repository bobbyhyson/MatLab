
clc;
% while true
%     clc;
% fprintf('\n ---------BOBBY''S SILLY EE MENU--------- \n');
% 
% fprintf('\n0) Polar to rectangular form\n');
% fprintf('1) Rectangular to Polar\n');
% fprintf('2) Parallel Resistors/inductos or Capacitors in Series\n');
% fprintf('3) Impedence values\n');
% fprintf('4) \n');
% fprintf('5) \n');
% fprintf('6) \n');
% fprintf('9) To exit\n');
% pickOne = input('Select what you would like to do: ', 's');
%-------------------------------------------------------------------------
% if isempty(pickOne)
%     disp('Invalid selection...')
% elseif all(isstrprop(pickOne, 'digit'))
%     choice = str2double(pickOne);

%-------------------------------------------------------------------------
    % switch choice
    % case 0 
    % clc;
    %     fprintf(['------------------Polar to Rectangular Calculator' ...
    %         '------------------\n']);
    %     while true
%-------------------------------------------------------------------------
% % Prompt user for magnitude and phase
% A = input('Input Magnitude: ');  
% phase = input('Input the Phase (degrees): \n');  
% % Convert polar to rectangular form
% phasor = A * exp(1j * deg2rad(phase));  
% % Display results
% fprintf('Rectangular form: %.3f + %.3fj\n', real(phasor), imag(phasor));
% 
% again = input('Return to menu? (y/n): ', 's');
%         if lower(again) ~= 'n'
%             break;
%         end
%         end

%-------------------------------------------------------------------------    
        % case 1
        % clc;
        % fprintf(['------------------Rectangular to Polar Calculator' ...
        %     '------------------']);
        % while true
        % % Gather inputs 
        % X = input('\nex: real + imaginaryj\n\nInput the values: \n');
        % absolute = abs(X);
        % degree = rad2deg(angle(X));
        % %Print output
        % fprintf('Phasor: %d∠%.3f°\n', X, degree);
        % 
        % again = input('Return to menu? (y/n): ', 's');
        % if lower(again) ~= 'n'
        %     break;
        % end
        % end


    
%-------------------------------------------------------------------------
    %     case 2
    %     clc;
    %     fprintf(['------------------Parallel Resistor/Inductor or ' ...
    %         'Capacitors in Series Calculator------------------\n']);
    %     while true
    %         fprintf(['\n--->MUST BE IN THIS FORM EX:[15 65 23] WITH THE ' ...
    %             'BRACKETS<---\n'])
    % X = input('Enter component values: ')
    % if isempty(X) || ~isnumeric(X)
    %     disp('Invalid input try again...')
    %     pause(2);
    %     continue;
    % end
    % 
    % answer = 1/sum(1 ./X);
    % 
    % 
    % fprintf('Answer: %.3f\n', answer);
    % again = input('Return to menu? (y/n): ', 's');
    %     if lower(again) ~= 'n'
    %         break;
    %     end
    %     end

    
%-------------------------------------------------------------------------        
    %     case 3
    % clc;
    % fprintf(['------------------Impedance Value Calculator' ...
    %     '------------------\n']);
    % 
    % while true
    %     decision = input(['Pick from the following:\n' ...
    %         'Calculating for:\nL) Inductor\nC) Capacitor\n> '], 's');
    % 
    %     if isempty(decision)
    %         disp('Invalid selection. Please enter L or C.');
    %         pause(1.5);
    %         continue;
    %     end
    % 
    %     decision = upper(decision); 
    % 
    %     switch decision
    %         case 'L'
    %             om = input('Enter ω (angular frequency): ');
    %             L = input('Enter L (inductance in H): ');
    %             Z = 1j * om * L;
    %             fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n' ...
    %                 , real(Z), imag(Z));
    % 
    %         case 'C'
    %             om = input('Enter ω (angular frequency): ');
    %             C = input('Enter C (capacitance in F): ');
    %             Z = -1j / (om * C);
    %             fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n' ...
    %                 , real(Z), imag(Z));
    % 
    %         otherwise
    %             disp('Invalid selection. Please enter L or C.');
    %     end
    % 
    %     again = input('Return to menu? (y/n): ', 's');
    %     if lower(again) ~= 'n'
    %         break;
    %     end
    % end
%-------------------------------------------------------------------------    
% 
%         case 9
%         fprintf('Exiting...\n')
%     break;
%     otherwise
%         disp('Invalid selection...');
%    end
%  else
%     disp('Invalid selection...')
% end

%end







clc;
breakFlag = false;  % Declare it here so it's 
                    %available globally in the loop

while true
    clc;
    fprintf(['\n------------------ BOBBY''S SILLY ' ...
        'EE MENU ------------------']);
    fprintf('\n0) Basic Circuit Equations\n');
    fprintf('1) AC Circuit Equations\n');
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
                                    I = input(['Enter current (' ...
                                        'I in amps): ']);
                                    R = input(['Enter resistance \\' ...
                                        '(R in ohms): ']);
                                    V = I * R;
                                    fprintf(['\nVoltage (V) = %.2f ' ...
                                    'volts\n'], V);
                                case 'I'
                                    V = input(['Enter voltage ' ...
                                        '(V in volts): ']);
                                    R = input(['Enter resistance ' ...
                                        '(R in ohms): ']);
                                    I = V / R;
                                    fprintf(['\nCurrent (I) = ' ...
                                        '%.2f amps\n'], I);
                                case 'R'
                                    V = input(['Enter voltage ' ...
                                        '(V in volts): ']);
                                    I = input(['Enter current ' ...
                                        '(I in amps): ']);
                                    R = V / I;
                                    fprintf(['\nResistance (R) = ' ...
                                        '%.2f ohms\n'], R);
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
                                '------------------\n']);

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
                    case 3

              
                        while true
                            clc;
                            fprintf(['\n------------------ ' ...
                                ' ' ...
                                '------------------\n']);




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
                fprintf(['1) Polar to Rectangular\n']);
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



                                    
            case 9
                        
                                        
                break;  % Back to main menu


            otherwise
                        
                disp('Invalid selection...');
                        
                pause(1.5);
                
            
                end
            end  % end AC Circuits menu loop






        case 9
            fprintf('Exiting...\n\n\n');
            break;  % Exit program

        otherwise
            disp('Invalid selection...');
            pause(1.5);
    end
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
