function f = EvaluateFunction(x)
    
    g = (x(1).^2 + x(2) - 11).^2 + (x(1) + x(2).^2 - 7).^2;
    f=1/g;
    
end