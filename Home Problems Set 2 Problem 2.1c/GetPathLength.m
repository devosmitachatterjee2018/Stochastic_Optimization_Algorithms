function pathLength = GetPathLength(path,cityLocation)
nodesInPath = size(path,2);
pathLength = 0;
for i=2:nodesInPath
    node1 = path(i);
    coordinateOfNode1 = cityLocation(node1,:);
    
    node2 = path(i-1);
    coordinateOfNode2 = cityLocation(node2,:);
    
    distance = norm(coordinateOfNode1 - coordinateOfNode2);
    pathLength = pathLength + distance;
    
end

end
