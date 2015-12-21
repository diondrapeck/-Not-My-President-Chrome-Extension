%% Petri Dish Colony Analyzer Algorithm
% Diondra D. Peck
% The Sanchez Lab at The Rowland Institute at Harvard

I = imread('SanchezLab_Colony2.png');

z = rgb2gray(I);

filtered = dishfilter(z);

segmented = colonysegmentation(BW2, z);
