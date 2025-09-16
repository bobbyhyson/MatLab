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
