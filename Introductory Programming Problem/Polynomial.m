function f = Polynomial(x, polynomialCoefficients) 

f=0;
n=length(polynomialCoefficients)-1;% degree of polynomial

for i=0:1:n
    f = polynomialCoefficients(i+1)*(x.^i)+f;
end

end