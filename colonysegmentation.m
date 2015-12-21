function [BW3] = colonysegmentation(BW2, z)

D = -bwdist(~BW2); % computes the distance transform of borderless image
L = watershed(D); % computes the watershed transform 
BW2(L == 0) = 0; % separates overlapping components

c = bwlabeln(BW2);% returns a label matrix for the components in BW2
objects = regionprops(BW2, z, 'Area', 'Perimeter', 'Eccentricity', 'Solidity'); % extracts the area, perimeter, and eccentricity of each component
table = struct2table(objects); 
writetable(table, 'data.xls');

objectsolidity = [objects.Solidity]; 
objectareas = [objects.Area]; 
objectperimeters = [objects.Perimeter];
objecteccentricities = [objects.Eccentricity];
objectcircularities = (4*pi*objectareas)./(objectperimeters.^2); % calculates circularity of each connected component 

allowable = (objectareas > 5 & objectcircularities > .8 & objecteccentricities < .9 & objectsolidity < 1);
keeper = find(allowable); % saves all components matching "allowable"
image = ismember(c, keeper); % reproduces image matrix with only objects in "keeper"
BW3 = bwlabel(image, 8); 
imshow(BW3), title('Colonies Only');
