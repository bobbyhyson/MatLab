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
