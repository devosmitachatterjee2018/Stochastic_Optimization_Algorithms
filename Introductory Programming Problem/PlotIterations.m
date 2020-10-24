function PlotIterations(polynomialCoefficients,iterationValues)

x = linspace(1.1,2.4,2000);
y = Polynomial(x, polynomialCoefficients);
plot(x,y)% plots y vs. x plot
hold on

x_pos = iterationValues;
y_pos = Polynomial(iterationValues, polynomialCoefficients);
plot(x_pos,y_pos,'ko')% iterates are marked as black circles

axis([1 2.4 7.5 11.5])
xlabel('x')
ylabel('f(x)')
title('The function f(x)= x^3 - x^2 - 2x + 10')

end