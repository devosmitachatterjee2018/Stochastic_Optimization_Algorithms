function iterationPoints = RunGradientDescent(startingPoint, muValue, stepLength, threshold)
    
iteration = 0;
 
x1 = startingPoint(1);
x2 = startingPoint(2);

gradientFunction = ComputeGradient(x1, x2, muValue);
L2norm = norm(gradientFunction, 2);
 
while L2norm > threshold %the gradient descent continues until the L2 norm of the gradient drops below the threshold 
    iteration = iteration + 1;
    
    x1 = x1 - stepLength*gradientFunction(1);
    x2 = x2 - stepLength*gradientFunction(2);
    
    gradientFunction = ComputeGradient(x1, x2, muValue);
    L2norm = norm(gradientFunction, 2);
end

iterationPoints = [x1 x2];

end

