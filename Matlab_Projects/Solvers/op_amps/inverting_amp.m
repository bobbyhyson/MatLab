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

                        