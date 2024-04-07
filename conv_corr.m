clear
clc
I = imread("gray.png"); % Read the Image
Ig = im2gray(I); % Ensuring About Image is Grayscale
gauss_kernel = fspecial('gaussian',[5,5],1); % A random kernel has been selected
convolution = conv2(double(Ig),gauss_kernel,'same'); %Convolution has been applied
correlation = conv2(double(Ig),rot90(gauss_kernel,2),'same'); %Correlation has been applied

sobel_kernel = fspecial('sobel'); % Sobel Kernel
laplacian_kernel = fspecial('laplacian'); % Sobel Kernel
prewitt_kernel = fspecial('prewitt'); %Prewitt Kernel

convolution_sobel = conv2(double(Ig),sobel_kernel,'same'); 
%Convolution has been applied
correlation_sobel = conv2(double(Ig),rot90(sobel_kernel,2),'same'); 
%Correlation has been applied

convolution_laplacian = conv2(double(Ig),laplacian_kernel,'same'); 
%Convolution has been applied
correlation_laplacian = conv2(double(Ig),rot90(laplacian_kernel,2),'same'); 
%Correlation has been applied

convolution_prewitt = conv2(double(Ig),prewitt_kernel,'same'); 
%Convolution has been applied
correlation_prewitt = conv2(double(Ig),rot90(prewitt_kernel,2),'same'); 
%Correlation has been applied
figure;
subplot(2, 4, 1), imshow(Ig), title('Original Image'); % Plotting Gaussian Kernel
subplot(2, 4, 2), imshow(uint8(convolution)), title('Gaussian Convolution');
subplot(2, 4, 3), imshow(uint8(correlation)), title('Gaussian Correlation');
subplot(2, 4, 4), imshow(uint8(convolution - correlation)), title('Differ.');
subplot(2, 4, 5), imshow(Ig), title('Original Image'); % Plotting Gaussian Sobel Kernel
subplot(2, 4, 6), imshow(uint8(convolution_sobel)), title('Sobel Convolution');
subplot(2, 4, 7), imshow(uint8(correlation_sobel)), title('Sobel Correlation');
subplot(2, 4, 8), imshow(uint8(convolution_sobel - correlation_sobel)), title('Differ.');
figure;
subplot(2, 4, 1), imshow(Ig), title('Original Image'); % Plotting Laplacian Kernel
subplot(2, 4, 2), imshow(uint8(convolution_laplacian)), title('Laplacian Convolution');
subplot(2, 4, 3), imshow(uint8(correlation_laplacian)), title('Laplacian Correlation');
subplot(2, 4, 4), imshow(uint8(convolution_laplacian - correlation_laplacian)), title('Differ.');
subplot(2, 4, 5), imshow(Ig), title('Original Image'); % Plotting Prewitt Kernel
subplot(2, 4, 6), imshow(uint8(convolution_prewitt)), title('Prewitt Convolution');
subplot(2, 4, 7), imshow(uint8(correlation_prewitt)), title('Prewitt Correlation');
subplot(2, 4, 8), imshow(uint8(convolution_prewitt - correlation_prewitt)), title('Differ.');