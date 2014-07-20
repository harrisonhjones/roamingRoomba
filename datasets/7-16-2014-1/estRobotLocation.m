function [ P ] = estRobotLocation( initialGuess, landmarkLocations, distanceMeasurements, poseNum )
n = 1000;
tolerance = .01;
P = initialGuess;
for i = 1:n
    JJ = calcJDelta(P, landmarkLocations, distanceMeasurements, poseNum);
    kk = calcK(P, landmarkLocations, distanceMeasurements, poseNum);
%     (JJ'*JJ)^-1;
%     JJ'*kk;
    X = (JJ'*JJ)^-1*JJ'*kk;
    P = P + X';
    if(max(abs(X(:)))<tolerance)
        break
    end
end
