clear
clc
I = imread("gray.png"); % Read Biomedical Brain Image
Ig = im2gray(I); % Ensuring About Image is Grayscale
Igh = histeq(Ig); % Basic Histogram Equalized Image
Igh_a = Igh(100:300, 100:400); 
Igh_local= histeq(Igha,1000);
Igh(100:300, 100:400)=Igh_local; % Local Histogram Equalized Image
Igh_adapt = adapthisteq(Ig); % Adaptive Histogram Equalization Implementation
montage({Igh,Igh_adapt})
title('Basic Hist Eq. vs Adaptive Histogram Equalization ')