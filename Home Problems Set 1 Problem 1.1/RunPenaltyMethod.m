clear;clc;
%%
startingPointValue = [1 2]; stepLengthValue = 0.0001; thresholdValue = 10^-6; muSequenceValue = [1; 10; 100; 1000];
Data = zeros(4,2);

for i=1:length(muSequenceValue)
    
iterationPts = RunGradientDescent(startingPointValue, muSequenceValue(i), stepLengthValue, thresholdValue);
Data(i,:) = iterationPts;

end

VariableNames = {'mu', 'x1', 'x2'};
T = table(muSequenceValue, round(Data(:,1),3), round(Data(:,2),3), 'VariableNames',VariableNames)