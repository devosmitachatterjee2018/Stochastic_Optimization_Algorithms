function positions = InitializePositions(nParticles, range, nDimensions, r)%Initialize positions of the particles

    positions = zeros(nParticles,nDimensions);
    
    for i = 1:nParticles  
        for j = 1:nDimensions
            positions(i,j) = -range + r*(range-(-range));
        end 
    end
    
end
