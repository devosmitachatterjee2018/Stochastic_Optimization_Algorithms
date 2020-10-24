clear; clc;
%%
cityLocations = LoadCityLocations; %
nPaths = 30;
nCities = size(cityLocations,1); %
mutationProbability = 0.02;
nGenerations = 3000;
tournamentSelectionParameter = 0.8;
fitness = zeros(nPaths, 1);
targetValue = 123;

tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]); %
connection = InitializeConnections(cityLocations); %

paths = InitializePaths(nPaths,nCities);%
maximumFitness = 0;

for iGeneration = 1:nGenerations
    maximumFitness = 0.0;
    bestPathIndex = 0;
    for i= 1:nPaths
        currentPath = paths(i,:);
        fitness(i) = EvaluatePath(cityLocations,currentPath);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestPathIndex = i;
            PlotPath(connection,cityLocations,currentPath); %
            disp('Best fitness right now is')
            disp(1/maximumFitness)
        end
    end
    
    
    tempPaths = paths;
    
    %Selection
    for i = 1:2:nPaths
        i1 = TournamentSelect(fitness,tournamentSelectionParameter);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter);
        tempPaths(i,:) = paths(i1,:);
        tempPaths(i+1,:) = paths(i2,:);
        
    end
    
    %Mutation
    for i = 1:nPaths
        originalPath = tempPaths(i,:);
        mutatedPath = MutatePath(originalPath,mutationProbability);
        tempPaths(i,:) = mutatedPath;
    end
    
    %Elitism
    tempPaths(1,:) = paths(bestPathIndex,:);
    
    paths = tempPaths;
    disp('Iteration')
    disp(iGeneration)
end
disp('Best fitness')
disp(1/maximumFitness)