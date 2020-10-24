function gradientFunction = ComputeGradient(x_1, x_2, mu)

gradientFunction = zeros(2,1);

constraintEquation = x_1^2 + x_2^2 - 1;

if (constraintEquation > 0)
    gradientFunction(1) = 2*(x_1 - 1)+4*mu*x_1*(x_1^2 + x_2^2 -1);
    gradientFunction(2) = 4*(x_2 - 2)+4*mu*x_2*(x_1^2 + x_2^2 -1);
else
    gradientFunction(1) = 2*(x_1 - 1);
    gradientFunction(2) = 4*(x_2 - 2);
end

end