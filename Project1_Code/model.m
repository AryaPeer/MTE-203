clc;
clear;

% Define array theta and the number of tubes for the modelling of the system
theta = linspace(0, 2*pi, 100);
numTubes = 6;

% set the cylinders a and b radius
cylinderRadiusA = 400;
cylinderRadiusB = 200;

% set the cylinders min and max in y
cylinderHeightMin = 0;
cylinderHeightMax = 3000;

% set the width and depths of the tubes
tubeWidth = 100;
tubeDepth = 50;

% set the tubes spacing and center
tubeSpacing = (cylinderHeightMax - (numTubes * tubeWidth)) / (numTubes + 1);
tubeCenters = tubeSpacing * (1:numTubes) + tubeWidth * (0:(numTubes-1)) + tubeWidth / 2;

% set the x and z of the of the cylindersas funcs
x = cylinderRadiusA * cos(theta);
z = cylinderRadiusB * sin(theta);

%set the y limits as the distance between 0 and 3000
y = [cylinderHeightMin, cylinderHeightMax];

%meshgrid for x and y
[X, Y] = meshgrid(x, y);
[Z, Y] = meshgrid(z, y);

% template for how the rube should be calculated for each of the 6 tubes
verticesTemplate = [
    -cylinderRadiusA, -tubeWidth/2, -tubeDepth/2;
     cylinderRadiusA, -tubeWidth/2, -tubeDepth/2;
     cylinderRadiusA,  tubeWidth/2, -tubeDepth/2;
    -cylinderRadiusA,  tubeWidth/2, -tubeDepth/2;
    -cylinderRadiusA, -tubeWidth/2,  tubeDepth/2;
     cylinderRadiusA, -tubeWidth/2,  tubeDepth/2;
     cylinderRadiusA,  tubeWidth/2,  tubeDepth/2;
    -cylinderRadiusA,  tubeWidth/2,  tubeDepth/2
];

sides = [
    1 2 3 4;
    5 6 7 8;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8
];

% start plotting 
figure;
hold on;
view(3);

axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');

title('Shell and Bars Plot');


% Mesh for the shell
mesh(X, Y, Z, 'EdgeColor', 'k', 'FaceColor', [0.5 0.5 0.5], 'FaceAlpha', 0.6);

% modelling the tubes based on the width and depth of the bars
for i = 1:numTubes
    % check array
    tubeCenter = tubeCenters(i);

    %set the min and max in y for the tube
    yTubeMin = tubeCenter - tubeWidth / 2;
    yTubeMax = tubeCenter + tubeWidth / 2;
    
    %set the vertices of the tube
    vertices = verticesTemplate;
    vertices(:, 2) = vertices(:, 2) + tubeCenter;

    %model it based on the vertices and sides arrays
    patch('Vertices', vertices, 'Faces', sides, 'FaceColor', 'red', 'EdgeColor', 'k');
end

hold off;
