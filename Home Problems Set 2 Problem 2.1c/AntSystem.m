clear;clc;
%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

numberOfAnts = 50;
alpha = 1.0;
beta = 3.0;
rho = 0.5;

nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation);
tau0 = numberOfAnts/nearestNeighbourPathLength;

targetPathLength = 123.0;

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0);
visibility = GetVisibility(cityLocation);
bestPath = zeros(1,numberOfCities);

minimumPathLength = inf;

iIteration = 0;

while (minimumPathLength > targetPathLength)
    iIteration = iIteration + 1;
    
    pathCollection = [];
    pathLengthCollection = [];
    for k = 1:numberOfAnts
        path = GeneratePath(pheromoneLevel, visibility, alpha, beta);
        pathLength = GetPathLength(path,cityLocation);
        if (pathLength < minimumPathLength)
            minimumPathLength = pathLength;
            bestPath = path(1:numberOfCities);
            fprintf('Iteration %d, ant %d: path length = %.5f\n',iIteration,k,minimumPathLength);
            PlotPath(connection,cityLocation,path);
        end
        pathCollection = [pathCollection; path];
        pathLengthCollection = [pathLengthCollection; pathLength];
    end
    
    deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
    pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);
    
end

matlab.io.saveVariablesToScript('BestResultFound.m','bestPath')

