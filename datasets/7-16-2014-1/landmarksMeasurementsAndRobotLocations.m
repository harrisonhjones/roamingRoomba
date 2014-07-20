close all
clc
clear

%% Data Setup
% Store landmark locations to a matrix
% Stored as x,y in inches
landmarkLocations = [101+3/8,0; ...
                     33+11/16,0; ...
                     46+15/16,0; ...
                     -2,92+3/4; ...
                     0,79+1/8];

% Store distance measurements to a matrix
% Each row coresponds to a difference robot location/pose
% Each column is the distance from the landmark to the robot in inches
% NaN indicates that a measurement was not made 
distanceMeasurements = [57.9375,88.75,NaN,NaN,102.8125; ...
                        61,90.875,NaN,NaN,102.5; ...
                        72.75,69.1875,64.5,NaN,65.75; ...
                        89.375,67.5625,67.125,51.125,43.4375; ...
                        88.75,66.6875,66.1875,51.625,44; ...
                        NaN,44.9375,44.6875,64.5,53.1875];

%% Data Crunching
% Step 1 - Make Initial Robot Location Guesses
[r,~] = size(distanceMeasurements);
initialGuess = zeros(r,2);
initialGuess(1,:) = mean(landmarkLocations(~isnan(distanceMeasurements(1,:)),:));
initialGuess(2,:) = mean(landmarkLocations(~isnan(distanceMeasurements(2,:)),:));
initialGuess(3,:) = mean(landmarkLocations(~isnan(distanceMeasurements(3,:)),:));
initialGuess(4,:) = mean(landmarkLocations(~isnan(distanceMeasurements(4,:)),:));
initialGuess(5,:) = mean(landmarkLocations(~isnan(distanceMeasurements(5,:)),:));

robotLocations = zeros(r,2);
disp('Estimating Robot Location for Pose 1');
robotLocations(1,:) = estRobotLocation([initialGuess(1,1),initialGuess(1,2)], landmarkLocations, distanceMeasurements, 1);
disp('Estimating Robot Location for Pose 2');
robotLocations(2,:) = estRobotLocation([initialGuess(2,1),initialGuess(2,2)], landmarkLocations, distanceMeasurements, 2);
disp('Estimating Robot Location for Pose 3');
robotLocations(3,:) = estRobotLocation([initialGuess(3,1),initialGuess(3,2)], landmarkLocations, distanceMeasurements, 3);
disp('Estimating Robot Location for Pose 4');
robotLocations(4,:) = estRobotLocation([initialGuess(4,1),initialGuess(4,2)], landmarkLocations, distanceMeasurements, 4);
disp('Estimating Robot Location for Pose 5');
robotLocations(5,:) = estRobotLocation([initialGuess(5,1),initialGuess(5,2)], landmarkLocations, distanceMeasurements, 5);


%% Plotting
% Setup
labels = cellstr( num2str([0:length(landmarkLocations)-1]') );
r = 2;
c = 3;
n = 1;

% Pose 1
subplot(r,c,n);
n = n + 1;
hold on
plot(landmarkLocations(:,1),landmarkLocations(:,2),'*');
text(landmarkLocations(:,1),landmarkLocations(:,2),labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
set(gca,'YDir','reverse');
drawMeasurements(landmarkLocations, distanceMeasurements,1);


plot(initialGuess(1,1),initialGuess(1,2),'^r');
plot(robotLocations(1,1),robotLocations(1,2),'^b');

title('Pose 1');
% Pose 2
subplot(r,c,n);
n = n + 1;
hold on
plot(landmarkLocations(:,1),landmarkLocations(:,2),'*');
text(landmarkLocations(:,1),landmarkLocations(:,2),labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
set(gca,'YDir','reverse');
drawMeasurements(landmarkLocations, distanceMeasurements,2);

plot(initialGuess(2,1),initialGuess(2,2),'^r');
plot(robotLocations(2,1),robotLocations(2,2),'^b');
title('Pose 2');
% Pose 3
subplot(r,c,n);
n = n + 1;
hold on
plot(landmarkLocations(:,1),landmarkLocations(:,2),'*');
text(landmarkLocations(:,1),landmarkLocations(:,2),labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
set(gca,'YDir','reverse');
drawMeasurements(landmarkLocations, distanceMeasurements,3);
plot(initialGuess(3,1),initialGuess(3,2),'^r');
plot(robotLocations(3,1),robotLocations(3,2),'^b');
title('Pose 3');
% Pose 4
subplot(r,c,n);
n = n + 1;
hold on
plot(landmarkLocations(:,1),landmarkLocations(:,2),'*');
text(landmarkLocations(:,1),landmarkLocations(:,2),labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
set(gca,'YDir','reverse');
drawMeasurements(landmarkLocations, distanceMeasurements,4);
plot(initialGuess(4,1),initialGuess(4,2),'^r');
plot(robotLocations(4,1),robotLocations(4,2),'^b');
title('Pose 4');
% Pose 5
subplot(r,c,n);
n = n + 1;
hold on
plot(landmarkLocations(:,1),landmarkLocations(:,2),'*');
text(landmarkLocations(:,1),landmarkLocations(:,2),labels, 'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
set(gca,'YDir','reverse');
drawMeasurements(landmarkLocations, distanceMeasurements,5);
plot(initialGuess(5,1),initialGuess(5,2),'^r');
plot(robotLocations(5,1),robotLocations(5,2),'^b');
title('Pose 5');