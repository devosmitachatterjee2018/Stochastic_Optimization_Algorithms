function derivativeCoefficients = PolynomialDifferentiation(polynomialCoefficients,k)

n = length(polynomialCoefficients)-1;% degree of polynomial
derivativeCoefficients = zeros(1,n);

if (n > k || n == k)
    for i=n:-1:1
        if (i > k || i == k)
            derivativeCoefficients(i) = polynomialCoefficients(i+1)*(factorial(i)/factorial(i-k));
        else
            derivativeCoefficients(i) = 0;
        end
    end
else
    error('The degree of the polynomial must be equal or larger than the order of the derivative.')
end

derivativeCoefficients(derivativeCoefficients==0)=[];

end

