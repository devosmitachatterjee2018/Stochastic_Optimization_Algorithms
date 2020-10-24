clc; clear;
%%
nnPathLength = 0;
cityLocation = LoadCityLocations();
nCities = length(cityLocation);
cities = (1:nCities)';

currentCity = randi(nCities);

cities = cities(cities ~=currentCity);
lengthOfCities = length(cities);

path = zeros(nCities,1);
iteration = 1;
path(iteration) = currentCity;

while(lengthOfCities ~= 0)
    currentCityCoordinate = cityLocation(currentCity,:);
    bestLength = inf;
    for iCity = 1:lengthOfCities
        
        nextCity = cities(iCity);
        nextCityCoordinate = cityLocation(nextCity,:);
        
        pathLengthToNextCity = norm(nextCityCoordinate - currentCityCoordinate);
        
        if(pathLengthToNextCity < bestLength)
            bestLength = pathLengthToNextCity;
            currentCity = nextCity;
        end
    end
    
    nnPathLength = nnPathLength + bestLength;
    iteration = iteration + 1;
    path(iteration) = currentCity;
    cities = cities(cities ~= currentCity);
    lengthOfCities = length(cities);
    
end

nextLastCity = path(nCities);
coordinateOfNextLastCity = cityLocation(nextLastCity,:);
lastCity = path(1);
coordinateOfLastCity = cityLocation(lastCity,:);
lastDistance = norm(coordinateOfLastCity - coordinateOfNextLastCity);
nnPathLength = nnPathLength + lastDistance
