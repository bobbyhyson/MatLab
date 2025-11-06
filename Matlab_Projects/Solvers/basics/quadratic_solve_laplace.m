function quadratic_solve_laplace()
    % QUADRATIC_SOLVE_LAPLACE
    % This function solves for 's' in the quadratic equation:
    % A*s^2 + B*s + C = 0
    % It asks for A, B, and C as user inputs.

    disp('Solve the quadratic equation: A*s^2 + B*s + C = 0');

    % Ask user for coefficients
    A = input('Enter coefficient A: ');
    B = input('Enter coefficient B: ');
    C = input('Enter coefficient C: ');

    % Check for invalid case
    if A == 0
        disp('Error: A cannot be zero for a quadratic equation.');
        return;
    end

    % Compute discriminant
    D = B^2 - 4*A*C;

    % Compute roots
    s1 = (-B + sqrt(D)) / (2*A);
    s2 = (-B - sqrt(D)) / (2*A);

    % Display results
    fprintf('The roots of the equation are:\n');
    fprintf('s1 = %.4f\n', s1);
    fprintf('s2 = %.4f\n', s2);
end
