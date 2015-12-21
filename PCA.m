function [score] = PCA(excel_file)
    
A = xlsread(excel_file); % returns excel file as a matlab data array, "A"
[coeff,score] = pca(A); % returns PCA coefficients and the % of total variance of each component
