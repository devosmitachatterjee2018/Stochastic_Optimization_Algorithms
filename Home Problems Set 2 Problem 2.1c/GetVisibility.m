function visibility = GetVisibility(cityLocation)
nCities = length(cityLocation);
visibility = zeros(nCities,nCities);
for i = 1:nCities
    
    for j = 1:nCities
        if(i == j)
            visibility(i,j) = 0;
        else
            city1 = cityLocation(i,:);
            city2 = cityLocation(j,:);
            distance = norm(city1 - city2);
            visibility(i,j) = 1/distance;
        end
    end
end
end