function iterationValues = NewtonRaphson(polynomialCoefficients, startingPoint, tolerance)

iterationValues=[];
j = 0;
iterationValues_old = startingPoint;
firstDerivative_old = Polynomial(iterationValues_old, PolynomialDifferentiation(polynomialCoefficients,1));
secondDerivative_old = Polynomial(iterationValues_old, PolynomialDifferentiation(polynomialCoefficients,2));
iterationValues(1) = NewtonRaphsonStep(iterationValues_old,firstDerivative_old,secondDerivative_old);

while abs(iterationValues(j+1)-iterationValues_old) >= tolerance% loop continues until expression is false 
    j = j+1;
    iterationValues_old = iterationValues(j);
    firstDerivative = Polynomial(iterationValues(j), PolynomialDifferentiation(polynomialCoefficients,1));
    secondDerivative = Polynomial(iterationValues(j), PolynomialDifferentiation(polynomialCoefficients,2));
    iterationValues(j+1) = NewtonRaphsonStep(iterationValues(j),firstDerivative,secondDerivative);
end

iterationValues = [startingPoint iterationValues];
fprintf('Iteration values are\n');
fprintf('%0.3f \t', iterationValues);% prints iteration values
fprintf('\n');

end


