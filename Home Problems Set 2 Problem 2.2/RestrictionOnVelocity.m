function velocity = RestrictionOnVelocity(currentVelocity,vMaximum)

magnitudeVelocity = abs(currentVelocity);

if(magnitudeVelocity > vMaximum)
    if (currentVelocity > 0)
        velocity = vMaximum;
    else
        velocity = -vMaximum;
    end
else
    velocity = currentVelocity;
end

end

