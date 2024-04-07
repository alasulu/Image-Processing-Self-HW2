clear
clc
I = imread("gray.png"); % Read Biomedical Brain Image
Ig = im2gray(I); % Ensuring About Image is Grayscale
Igh = histeq(Ig); % Basic Histogram Equalized Image
montage({Ig,Igh}); % Showing Two Images in 1 Figure
title('Original vs Basic Histogram Equalization')