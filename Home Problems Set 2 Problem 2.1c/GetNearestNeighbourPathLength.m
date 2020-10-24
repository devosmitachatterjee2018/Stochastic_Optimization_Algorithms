function nnPathLength = GetNearestNeighbourPathLength(cityLocation)

nnPathLength = 0;
nCities = length(cityLocation);
availableCities = (1:nCities)';

currentCity = randi(nCities);

availableCities = availableCities(availableCities ~=currentCity);
lengthOfAvailableCities = length(availableCities);

path = zeros(nCities,1);
pathIndex = 1;
path(pathIndex) = currentCity;

while(lengthOfAvailableCities ~= 0)
    currentCityCoordinate = cityLocation(currentCity,:);
    bestLength = inf;
    for iCity = 1:lengthOfAvailableCities
        
        nextCity = availableCities(iCity);
        nextCityCoordinate = cityLocation(nextCity,:);
        
        pathLengthToNextCity = norm(nextCityCoordinate - currentCityCoordinate);
        
        if(pathLengthToNextCity < bestLength)
            bestLength = pathLengthToNextCity;
            currentCity = nextCity;
        end
    end
    
    nnPathLength = nnPathLength + bestLength;
    pathIndex = pathIndex + 1;
    path(pathIndex) = currentCity;
    availableCities = availableCities(availableCities ~=currentCity);
    lengthOfAvailableCities = length(availableCities);
    
end

nextLastCity = path(nCities);
coordinateOfNextLastCity = cityLocation(nextLastCity,:);
lastCity = path(1);
coordinateOfLastCity = cityLocation(lastCity,:);
lastDistance = norm(coordinateOfLastCity - coordinateOfNextLastCity);
nnPathLength = nnPathLength + lastDistance;

end