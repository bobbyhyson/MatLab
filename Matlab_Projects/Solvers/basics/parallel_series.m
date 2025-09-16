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
    parallel_series
elseif strcmp(again, 'b')
    basics_menu
elseif strcmp(again, 'm')
    top_ee_menu
else
    disp(['Invalid input. ' ...
        'Returning to Basics menu...']);
    pause(1);
    basics_menu
end

