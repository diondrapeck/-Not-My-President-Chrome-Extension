function [BW2] = dishfilter(I)

z = rgb2gray(I); % converts to grayscale intensity image
H = wiener2(z); % filters to remove image noise
J = adapthisteq(H); % performs Contrast-limited Adaptive Histogram Equalization(CLAHE)
imshow(H), title('Filtered Image');

Jbw = im2bw(J); % converts image to black and white
JBW = imcomplement(Jbw); % computes complement of black and white image
imshow(JBW), title('Inverted Image');

BW = imclearborder(JBW); % removes all pixels (and their connected neighbors) on the image border
BW2 = xor(bwareaopen(BW, 10), bwareaopen(BW, 12500)); % removes all objects with < 10 pixels or > 12500 pixels
