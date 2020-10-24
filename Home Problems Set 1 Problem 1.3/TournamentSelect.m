function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
    
    j = tournamentSize;
    populationSize = size(fitness,1);
    Chromosomes = zeros(j,2);
    for i = 1:j
        iTmp = 1 + fix(rand*populationSize);
        Chromosomes(i,:) = [iTmp fitness(iTmp)];
    end

    
    select = 0;
    while (select == 0)
        sizeOfChromosomes = size(Chromosomes,1);
        if(sizeOfChromosomes == 1)
            iSelected = Chromosomes(1,1);
            select = 1;
        else
            [maxValue, maxIndex] = max(Chromosomes(:,2));
            r = rand;
            if (r < pTournament)
                iSelected = Chromosomes(maxIndex,1);
                select = 1;
            else
                Chromosomes(maxIndex,:) = [];
            end
        end
    end

end
