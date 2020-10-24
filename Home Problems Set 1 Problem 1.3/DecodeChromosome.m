function x = DecodeChromosome(chromosome,noOfVariables,variableRange)
    
    nGenes = size(chromosome,2);
    genesPerVariable = fix(nGenes/noOfVariables);
    x = zeros(1,noOfVariables);
    
    g = 0;%gene position
    
    for i = 1:noOfVariables    
        for j = 1:genesPerVariable
            g = g+1;
            x(i) = x(i) + chromosome(g)*2^(-j);
        end
        x(i) =-variableRange + 2*variableRange*x(i)/(1-2^(-genesPerVariable));
    end
    
end