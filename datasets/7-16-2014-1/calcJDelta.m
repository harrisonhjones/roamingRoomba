function [J] = calcJDelta(initialGuess, landmarkLocations, distanceMeasurements, poseNum)

[r,c] = size(distanceMeasurements);
[~,c2] = size(distanceMeasurements(~isnan(distanceMeasurements(1,:))));

J = zeros(c2,1);
j = 1;

if(poseNum > r)
    error('Specified PoseNum is greater than the number of poses');
else
    for i = 1:c
        distance = distanceMeasurements(poseNum,i);
        if (isnan(distance))
            continue;
        else
            ddPx = 1/2*sqrt((landmarkLocations(i,1)-initialGuess(1,1))^2+(landmarkLocations(i,2)-initialGuess(1,2))^2)^-1*(-2*landmarkLocations(i,1)+2*initialGuess(1,1));
            ddPy = 1/2*sqrt((landmarkLocations(i,1)-initialGuess(1,1))^2+(landmarkLocations(i,2)-initialGuess(1,2))^2)^-1*(-2*landmarkLocations(i,2)+2*initialGuess(1,2));
            J(j,1) = ddPx;
            J(j,2) = ddPy; 
            j = j + 1;
        end
    end
end


