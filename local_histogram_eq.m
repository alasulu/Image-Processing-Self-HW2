clear
clc
I=imread("gray.png"); % Read Biomedical Brain Image
Ig= im2gray(I); % Ensuring About Image is Grayscale
Igh = histeq(Ig); % Basic Histogram Equalized Image
Igh_a = Igh(100:300, 100:400); 
Igh_local= histeq(Igh_a,1000);
Igh(100:300, 100:400)=Igh_local; % Local Histogram Equalized Image
imshowpair(Ig,Igh_local,'montage') % Showing Two Images in 1 Figure