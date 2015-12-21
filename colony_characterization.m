%% Petri Dish Colony Analyzer Algorithm
% Diondra D. Peck
% The Sanchez Lab at The Rowland Institute at Harvard

I = imread('SanchezLab_Colony2.png');

z = rgb2gray(I);

filtered = dishfilter(z);

segmented = colonysegmentation(BW2, z);

[label, NUM] = bwlabeln(BW3); % returns the number of colonies
message = sprintf('There are %d colonies.', NUM); 
h = msgbox(message); % displays number of colonies found

objects1 = regionprops(BW3, z, 'Area','Eccentricity','Perimeter'); % extract properties of each colony

t = struct2table(objects1); 
writetable(t, 'colonyprops.xls'); % write property info to excel
