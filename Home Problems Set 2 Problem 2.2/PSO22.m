clc; clear;
%%
N = 20;% Number of particles
range = 5;
n = 2;% dimension
randomNumber = rand;

a = 0.01;% a is a small positive constant 

c1 = 2;
c2 = 2;
vMax = 5;
inertiaWeight = 1.4;

x = InitializePositions(N,range,n,randomNumber);
v = InitializeVelocities(N,range,n,randomNumber);

particleBest = x;
swarmBest = zeros(1,2);
functionValues = zeros(N,1);
previousFunctionValues = zeros(N,1);
bestFunctionValue = 0;
numberOfIterations = 10000;

X = linspace(-5,5);
Y=linspace(-5,5);
[X,Y]=meshgrid(X,Y);
Z=ContourFunction(a,X,Y);
hold on
contour(X,Y,Z,'ShowText','on')

for iIteration = 1:numberOfIterations
    
    if (bestFunctionValue >= 10^23)
       fprintf('Coordinates are (%.6f,%.6f)\n',swarmBest(1),swarmBest(2))
       break;
    end
    
    disp('Iteration')
    disp(iIteration)
    disp('Best function value')
    disp(bestFunctionValue)
    
    %% Evaluate each particle in the swarm
    for iParticle =1:N
        currentParticle = x(iParticle,:);
        functionValues(iParticle) = EvaluateFunction(currentParticle);
    end
    
    %% Update the best position of each particle, and the global best position
    for iParticle = 1:N

        previousFunctionValue = previousFunctionValues(iParticle);    
        currentFunctionValue = functionValues(iParticle);

        if (previousFunctionValue < currentFunctionValue)
            particleBest(iParticle,:) = x(iParticle,:);
        end

        if(currentFunctionValue > bestFunctionValue)
            swarmBest = x(iParticle,:);
            bestFunctionValue = currentFunctionValue;
        end

    end
    
    previousFunctionValues = functionValues;
    %% Update particle velocities and positions
    for iParticle = 1:N
        for jDimension = 1:n
            q = rand;
            r = rand;
            velocity = v(iParticle,jDimension);
            position = x(iParticle,jDimension);

            velocity = velocity + c1*q*(particleBest(iParticle,jDimension)-position)+ c2*r*(swarmBest(jDimension)-position);

            velocity = RestrictionOnVelocity(velocity,vMax);
            velocity = inertiaWeight * velocity;
            v(iParticle,jDimension) = velocity;

            position = position + velocity;
            x(iParticle,jDimension) = position;
        end
    end
    
    if(inertiaWeight>0.4)
        beta = 0.99; % very close to 1
        inertiaWeight= beta * inertiaWeight;
    end
    
    %hold on
    plot(swarmBest(1),swarmBest(2),'ro')
    hold on
end



