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
