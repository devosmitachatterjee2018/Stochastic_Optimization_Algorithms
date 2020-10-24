function x_new = NewtonRaphsonStep(x_old,firstDerivative,secondDerivative)

x_new = x_old-firstDerivative/secondDerivative;% Newton-Raphson iteration step

end