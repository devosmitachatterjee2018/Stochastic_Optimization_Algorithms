function f = EvaluateIndividual(x)

f1 = (x(1)+x(2)+1)^2;
f2 = 19-14*x(1)+3*x(1)^2-14*x(2)+6*x(1)*x(2)+3*x(2)^2;
f3 = (2*x(1)-3*x(2))^2;
f4 = 18-32*x(1)+12*x(1)^2+48*x(2)-36*x(1)*x(2)+27*x(2)^2;

fNumerator1 = 1+f1*f2;
fNumerator2 = 30+f3*f4;

g = fNumerator1*fNumerator2;

f = 1/g;

end