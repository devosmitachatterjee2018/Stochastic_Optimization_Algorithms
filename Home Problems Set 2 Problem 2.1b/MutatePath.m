function mutatedPath = MutatePath(path,mutationProbability)

nCities = size(path,2);
mutatedPath = path;
for j = 1:nCities
    r = rand;
    if (r < mutationProbability)
        randomIndex = randi(nCities);
        mutatedPath(j) = path(randomIndex);
        mutatedPath(randomIndex) = path(j);
        path = mutatedPath;
    end
end

end