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
