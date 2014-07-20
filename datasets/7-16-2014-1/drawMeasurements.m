function drawMeasurements(landmarkLocations, distanceMeasurements, poseNum )

[r,c] = size(distanceMeasurements);

if(poseNum > r)
    error('Specified PoseNum is greater than the number of poses');
else
    for i = 1:c
        distance = distanceMeasurements(poseNum,i);
        if (isnan(distance))
            continue;
        else
            rectangle('position',[landmarkLocations(i,1)-distance, landmarkLocations(i,2)-distance, 2*distance, 2*distance],'curvature',[1 1]);
        end
    end
end

