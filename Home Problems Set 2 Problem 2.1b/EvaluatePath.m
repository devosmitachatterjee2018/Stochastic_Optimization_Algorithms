function f = EvaluatePath(cityLocations,currentPath)
nCities = size(cityLocations,1);
totalDistance = 0;

for iCity = 2:1:nCities
    currentCity = currentPath(iCity-1);
    coordinateOfCurrentCity = cityLocations(currentCity,:);
    
    nextCity = currentPath(iCity);
    coordinateOfNextCity = cityLocations(nextCity,:);
    
    currentDistance = norm(coordinateOfCurrentCity-coordinateOfNextCity);
    totalDistance = totalDistance + currentDistance;
end
nextLastCity = currentPath(nCities);
coordinateOfNextLastCity = cityLocations(nextLastCity,:);

%The last city is the same as the first city
lastCity = currentPath(1);
coordinateOfLastCity = cityLocations(lastCity,:);

lastDistance = norm(coordinateOfLastCity - coordinateOfNextLastCity);
totalDistance = totalDistance + lastDistance;
f = 1/totalDistance;
end
