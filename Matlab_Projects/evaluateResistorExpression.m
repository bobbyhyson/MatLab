
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
        while ~isempty(operatorStack) && isKey(precedence, ...
                operatorStack{end}) && ...
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
