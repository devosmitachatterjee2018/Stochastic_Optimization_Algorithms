function f = ContourFunction(a,X,Y)
    
    f1 = (X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2;
    f = log(a+f1);
    
end