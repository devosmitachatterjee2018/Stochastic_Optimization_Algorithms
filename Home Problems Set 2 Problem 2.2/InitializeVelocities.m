function velocities = InitializeVelocities(nParticles, range, nDimensions, r)%Initialize velocities of the particles

    velocities = zeros(nParticles,nDimensions);
    
    for i = 1:nParticles
        for j = 1:nDimensions
            velocities(i,j) = -range + r*(range-(-range));
        end
    end
    
end
