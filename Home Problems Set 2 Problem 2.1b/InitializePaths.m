function paths = InitializePaths(nPaths, nCities)
paths = zeros(nPaths, nCities);
for i = 1:nPaths
    paths(i,:) = randperm(nCities);
end
end