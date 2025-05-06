


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
                        clc;
                        while true

                            fprintf(['\n------------------ Ohm''s Law Calculator! ------------------\n']);
                            fprintf('Enter values below. Leave the one you want to calculate blank.\n');
                            fprintf('Type ''b'' to go back to Basics menu or ''q'' to return to Main menu at any prompt.\n');

                            % Voltage input
                            temp = input('Enter voltage (V): ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp)
                                V = [];
                            else
                                V = str2double(temp);
                            end

                            % Current input
                            temp = input('Enter current (I): ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp)
                                I = [];
                            else
                                I = str2double(temp);
                            end

                            % Resistance input
                            temp = input('Enter resistance (R): ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp)
                                R = [];
                            else
                                R = str2double(temp);
                            end

                            % Determine what to calculate
                            if isempty(V) && ~isempty(I) && ~isempty(R)
                                V = I * R;
                                fprintf('\nVoltage (V) = %.2f volts\n', V);
                            elseif isempty(I) && ~isempty(V) && ~isempty(R)
                                I = V / R;
                                fprintf('\nCurrent (I) = %.2f amps\n', I);
                            elseif isempty(R) && ~isempty(V) && ~isempty(I)
                                R = V / I;
                                fprintf('\nResistance (R) = %.2f ohms\n', R);
                            else
                                fprintf('\nError: Leave exactly one value blank to calculate it.\n');
                            end

                            pause(2);
                        end
                    case 1
                        clc;
                        while true

                            fprintf(['\n------------------ Parallel' ...
                                ' or Series Components' ...
                                ' ------------------\n']);

                            fprintf(['ex: 10 + 20||20 = 20\nIT ' ...
                                'WILL TAKE PRIORITY OF PARALLEL' ...
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
                        clc;
                        while true

                            fprintf(['\n------------------ Impedance Calculator ------------------\n']);
                            fprintf('Pick from the following:\n');
                            fprintf('L) Inductor\nC) Capacitor\n');
                            fprintf('Type ''b'' to go back or ''q'' to quit to main menu at any prompt.\n');

                            % User decision
                            decision = input('> ', 's');
                            decision = upper(strtrim(decision));

                            if strcmp(decision, 'B')
                                break;
                            elseif strcmp(decision, 'Q')
                                breakFlag = true;
                                break;
                            elseif ~ismember(decision, {'L', 'C'})
                                disp('Invalid selection. Please enter L or C.');
                                pause(1.5);
                                continue;
                            end

                            % Angular frequency input
                            temp = input('Enter ω (angular frequency): ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp) || isnan(str2double(temp))
                                disp('Invalid input for ω.');
                                pause(1.5);
                                continue;
                            else
                                om = str2double(temp);
                            end

                            % Component input (L or C)
                            switch decision
                                case 'L'
                                    temp = input('Enter L (inductance in H): ', 's');
                                    if strcmpi(temp, 'b')
                                        break;
                                    elseif strcmpi(temp, 'q')
                                        breakFlag = true;
                                        break;
                                    elseif isempty(temp) || isnan(str2double(temp))
                                        disp('Invalid input for L.');
                                        pause(1.5);
                                        continue;
                                    else
                                        L = str2double(temp);
                                        Z = 1j * om * L;
                                        fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n', real(Z), imag(Z));
                                    end

                                case 'C'
                                    temp = input('Enter C (capacitance in F): ', 's');
                                    if strcmpi(temp, 'b')
                                        break;
                                    elseif strcmpi(temp, 'q')
                                        breakFlag = true;
                                        break;
                                    elseif isempty(temp) || isnan(str2double(temp))
                                        disp('Invalid input for C.');
                                        pause(1.5);
                                        continue;
                                    else
                                        C = str2double(temp);
                                        Z = -1j / (om * C);
                                        fprintf('Impedance (Z) = %.3f + %.3fj Ohms\n', real(Z), imag(Z));
                                    end
                            end

                            pause(2);
                        end

                    case 1
                        clc;

                        while true
                            fprintf(['\n------------------ Polar to Rectangular Calculator ------------------\n']);
                            fprintf('Enter values below or type ''b'' to go back, ''q'' to main menu.\n');

                            % Magnitude input
                            temp = input('Input Magnitude: ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp) || isnan(str2double(temp))
                                disp('Invalid input for Magnitude.');
                                pause(1.5);
                                continue;
                            else
                                A = str2double(temp);
                            end

                            % Phase input
                            temp = input('Input Phase (degrees): ', 's');
                            if strcmpi(temp, 'b')
                                break;
                            elseif strcmpi(temp, 'q')
                                breakFlag = true;
                                break;
                            elseif isempty(temp) || isnan(str2double(temp))
                                disp('Invalid input for Phase.');
                                pause(1.5);
                                continue;
                            else
                                phase = str2double(temp);
                            end

                            % Convert and display
                            phasor = A * exp(1j * deg2rad(phase));
                            fprintf('Rectangular form: %.3f + %.3fj\n', real(phasor), imag(phasor));

                            pause(2);
                        end
                    case 3
                        clc;
                        while true
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
                            fprintf('\n------------------ Capacitor Charging Calculator ------------------\n');
                            fprintf('Type ''b'' to go back, ''q'' to quit to main menu.\n');

                            temp = input('Input V0: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Vol = str2double(temp); end

                            temp = input('Input R: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Res = str2double(temp); end

                            temp = input('Input C: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Cap = str2double(temp); end

                            temp = input('Input t: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, tim = str2double(temp); end

                            timeDomain = Vol * (1 - exp(-tim / (Res * Cap)));
                            fprintf('\nV(t) = %.3f\n', timeDomain);
                            pause(2);
                        end

                    case 1
                        while true
                            clc;
                            fprintf('\n------------------ Capacitor Discharging Calculator ------------------\n');
                            fprintf('Type ''b'' to go back, ''q'' to quit to main menu.\n');

                            temp = input('Input V0: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Vol = str2double(temp); end

                            temp = input('Input R: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Res = str2double(temp); end

                            temp = input('Input C: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Cap = str2double(temp); end

                            temp = input('Input t: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, tim = str2double(temp); end

                            timeDomain = Vol * exp(-tim / (Res * Cap));
                            fprintf('\nV(t) = %.3f\n', timeDomain);
                            pause(2);
                        end
                    case 2
                        while true
                            clc;
                            fprintf('\n------------------ Inductor Charging Calculator ------------------\n');
                            fprintf('Type ''b'' to go back, ''q'' to quit to main menu.\n');

                            temp = input('Input I0: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Amp = str2double(temp); end

                            temp = input('Input R: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Res = str2double(temp); end

                            temp = input('Input L: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Ind = str2double(temp); end

                            temp = input('Input t: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, tim = str2double(temp); end

                            timeDomain = Amp * (1 - exp(-tim / (Ind / Res)));
                            fprintf('\nI(t) = %.3f\n', timeDomain);
                            pause(2);
                        end
                    case 3
                        while true
                            clc;
                            fprintf('\n------------------ Inductor Discharging Calculator ------------------\n');
                            fprintf('Type ''b'' to go back, ''q'' to quit to main menu.\n');

                            temp = input('Input I0: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Amp = str2double(temp); end

                            temp = input('Input R: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Res = str2double(temp); end

                            temp = input('Input L: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, Ind = str2double(temp); end

                            temp = input('Input t: ', 's');
                            if strcmpi(temp, 'b'), break;
                            elseif strcmpi(temp, 'q'), breakFlag = true; break;
                            else, tim = str2double(temp); end

                            timeDomain = Amp * exp(-tim / (Ind / Res));
                            fprintf('\nI(t) = %.3f\n', timeDomain);
                            pause(2);
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
                        %end of case 0

                    case 1
                        while true
                            clc;
                            fprintf(['\n------------------ Inverting Summ' ...
                                ' ' ...
                                'ing Amplifier Calculator ' ...
                                '------------------\n']);
                            fprintf('Enter known values (leave unknowns blank):\n');


                            Vo = input('Vo (output voltage) = ');
                            Va = input('Va (input voltage) = ');
                            Vb = input('Vb (input voltage) = ');
                            Vc = input('Vc (input voltage) = ');
                            Rf = input('Rf (feedback resistor in ohms) = ');
                            Ra = input('Ra (input resistor in ohms) = ');
                            Rb = input('Rb (input resistor in ohms) = ');
                            Rc = input('Rc (input resistor in ohms) = ');

                            knownVars = struct();
                            if ~isempty(Vo), knownVars.Vo = Vo; end
                            if ~isempty(Va), knownVars.Va = Va; end
                            if ~isempty(Vb), knownVars.Vb = Vb; end
                            if ~isempty(Vc), knownVars.Vc = Vc; end
                            if ~isempty(Rf), knownVars.Rf = Rf; end
                            if ~isempty(Ra), knownVars.Ra = Ra; end
                            if ~isempty(Rb), knownVars.Rb = Rb; end
                            if ~isempty(Rc), knownVars.Rc = Rc; end

                            try
                                result = opamp_solver('inverting_summing', ...
                                    knownVars);
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
                        %end of case 1

                    case 2
                        while true
                            clc;
                            fprintf(['\n------------------ NonInverting ' ...
                                ' ' ...
                                'Amplifier Calculator ------------------' ...
                                '\n']);

                            fprintf(['Enter known values (leave ' ...
                                'unknowns blank):\n']);

                            Vo = input('Vo (output voltage) = ');
                            Vg = input('Vg (input voltage) = ');
                            Rf = input('Rf (feedback resistor in ohms) = ');
                            Rs = input('Rs (input resistor in ohms) = ');

                            knownVars = struct();
                            if ~isempty(Vo), knownVars.Vo = Vo; end
                            if ~isempty(Vg), knownVars.Vg = Vg; end
                            if ~isempty(Rf), knownVars.Rf = Rf; end
                            if ~isempty(Rs), knownVars.Rs = Rs; end

                            try
                                result = opamp_solver('noninverting', ...
                                    knownVars);
                                disp('--- Solved Value ---');
                                disp(result);
                            catch err
                                disp('Could not solve equation:');
                                disp(err.message);
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
                            fprintf(['\n------------------ Difference Ampli' ...
                                'fier Calculator ------------------\n']);

                            Vo = input('Vo (output voltage) = ');
                            Va = input('Va (input voltage) = ');
                            Vb = input('Vb (input voltage) = ');
                            Ra = input('Ra (feedback resistor in ohms) = ');
                            Rb = input('Rb (input resistor in ohms) = ');
                            Rc = input('Rc (input resistor in ohms) = ');
                            Rd = input('Rd (input resistor in ohms) = ');

                            knownVars = struct();
                            if ~isempty(Vo), knownVars.Vo = Vo; end
                            if ~isempty(Va), knownVars.Va = Va; end
                            if ~isempty(Vb), knownVars.Vb = Vb; end
                            if ~isempty(Ra), knownVars.Ra = Ra; end
                            if ~isempty(Rb), knownVars.Rb = Rb; end
                            if ~isempty(Rc), knownVars.Rc = Rc; end
                            if ~isempty(Rd), knownVars.Rd = Rd; end

                            try
                                result = opamp_solver('difference', knownVars);
                                disp('--- Solved Value ---');
                                disp(result);
                            catch err
                                disp('Could not solve equation:');
                                disp(err.message);
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

                        %end of case 3


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






%Op Amps

function result = opamp_solver(configType, knownVars)
switch lower(configType)
    case 'inverting'
        result = solve_inverting(knownVars);
    case 'inverting_summing'
        result = solve_inverting_summing(knownVars);
    case 'noninverting'
        result = solve_noninverting(knownVars);
    case 'difference'
        result = solve_differenceAmp(knownVars);
    otherwise

        error('Unknown op amp configuration.');
end
end


%inverting summing
function result = solve_inverting_summing(vars)
syms Vo Va Vb Vc Rf Ra Rb Rc

eq = Vo == -(((Rf/Ra)*Va)+((Rf/Rb)*Vb)+((Rf/Rc)*Vc));

% Substitute known values
fields = fieldnames(vars);
for i = 1:length(fields)
    eq = subs(eq, sym(fields{i}), vars.(fields{i}));
end

unknowns = setdiff({'Vo','Va','Vb','Vc','Rf','Ra','Rb','Rc',}, fields);
if length(unknowns) ~= 1
    error('You must provide exactly Seven known variables.');
end

sol = solve(eq, sym(unknowns{1}));
result.(unknowns{1}) = double(sol);
end


%inverting
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

%noninverting
function result = solve_noninverting(vars)
syms Vo Vg Rf Rs

eq = Vo == (Rf+Rs) / Rs * Vg;

% Substitute known values
fields = fieldnames(vars);
for i = 1:length(fields)
    eq = subs(eq, sym(fields{i}), vars.(fields{i}));
end

unknowns = setdiff({'Vo','Vg','Rf','Rs'}, fields);
if length(unknowns) ~= 1
    error('You must provide exactly three known variables.');
end

sol = solve(eq, sym(unknowns{1}));
result.(unknowns{1}) = double(sol);
end
%end noninverting

%difference
function result = solve_differenceAmp(vars)
syms Vo Va Vb Ra Rb Rc Rd

eq = Vo == (((Rd*(Ra+Rb)))/((Ra*(Rc+Rd)))*Vb)-((Rb/Ra)*Va);

% Substitute known values
fields = fieldnames(vars);
for i = 1:length(fields)
    eq = subs(eq, sym(fields{i}), vars.(fields{i}));
end

unknowns = setdiff({'Vo','Va','Vb','Ra','Rb','Rc','Rd'}, fields);
if length(unknowns) ~= 1
    error('You must provide exactly six known variables.');
end

sol = solve(eq, sym(unknowns{1}));
result.(unknowns{1}) = double(sol);
end
%end difference


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
