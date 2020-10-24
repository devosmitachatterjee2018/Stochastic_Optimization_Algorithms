function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

nAnts = size(pathCollection,1);
nNodesInPath = size(pathCollection,2);
deltaPheromoneLevel = zeros(nNodesInPath-1);

for currentAnt = 1:nAnts
    currentPath = pathCollection(currentAnt,:);
    currentPathLength = pathLengthCollection(currentAnt);
    
    
    pheromoneToAdd = 1/currentPathLength;
    
    for currentNode = 2:nNodesInPath
        destinationNode = currentPath(currentNode);
        startNode = currentPath(currentNode-1);
        
        deltaPheromoneLevel(startNode,destinationNode) = deltaPheromoneLevel(startNode,destinationNode) + pheromoneToAdd;
        
    end
    
end


end