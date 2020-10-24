function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

nNodes = size(pheromoneLevel,1);

listOfNodes(:,1) = 1:nNodes;

currentNode = randi(nNodes);

nodeCount = 1;
path(nodeCount) = currentNode;
listOfNodes = listOfNodes(listOfNodes ~= currentNode);

lengthOfListOfNodes = length(listOfNodes);


while (lengthOfListOfNodes ~= 0)
    probability = zeros(lengthOfListOfNodes,1);
    
    denominator = 0;
    for l = 1:lengthOfListOfNodes
        node2 = listOfNodes(l);
        tau2 = pheromoneLevel(node2,currentNode);
        eta2 = visibility(node2,currentNode);
        currentSum = tau2^alpha * eta2^beta;
        denominator = denominator + currentSum;
    end
    
    for i = 1:lengthOfListOfNodes
        nextNodeMove = listOfNodes(i);
        tau = pheromoneLevel(nextNodeMove,currentNode);
        eta = visibility(nextNodeMove,currentNode);
        numerator = tau^alpha * eta^beta;
        probability(i) = numerator / denominator;
    end
    
    
    for i = 2:1:lengthOfListOfNodes
        probability(i) = probability(i)+probability(i-1);
    end
    
    r = rand;
    for i=1:lengthOfListOfNodes
        if (r <= probability(i))
            currentNode = listOfNodes(i);
            break;
        end
    end
    
    nodeCount = nodeCount +1;
    path(nodeCount) = currentNode;
    listOfNodes = listOfNodes(listOfNodes~=currentNode);
    lengthOfListOfNodes = length(listOfNodes);
end

path(nNodes+1) = path(1);
end

