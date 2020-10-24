function iSelected = TournamentSelect(fitness, pTournament)

nPaths = size(fitness,1);
iTmp1 = randi(nPaths);
iTmp2 = randi(nPaths);

r = rand;

if (r < pTournament)
    if (fitness(iTmp1) > fitness(iTmp2))
        iSelected = iTmp1;
    else
        iSelected = iTmp2;
    end
else
    if (fitness(iTmp1) > fitness(iTmp2))
        iSelected = iTmp2;
    else
        iSelected = iTmp1;
    end
end

end
