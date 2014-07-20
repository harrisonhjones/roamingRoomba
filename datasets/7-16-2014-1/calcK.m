function [K] = calcK(initialGuess, landmarkLocations, distanceMeasurements, poseNum)


[r,c] = size(distanceMeasurements);
[~,c2] = size(distanceMeasurements(~isnan(distanceMeasurements(1,:))));
K = zeros(c2,1);
j = 1;

if(poseNum > r)
    error('Specified PoseNum is greater than the number of poses');
else
    for i = 1:c
        distance = distanceMeasurements(poseNum,i);
        if (isnan(distance))
            continue;
        else
            K(j,1) = distance-sqrt((landmarkLocations(i,1)-initialGuess(1,1))^2+(landmarkLocations(i,2)-initialGuess(1,2))^2);
            j = j + 1;
        end
    end
end


