function modifiedPopulation = InsertBestIndividual(population,bestIndividual,noOfCopies)

    modifiedPopulation = population;
    for i = 1:noOfCopies
        modifiedPopulation(i,:) = bestIndividual;
    end
    
end