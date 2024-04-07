clear
clc
I = imread("grayscale_brain.png");
Ig = im2gray(I);
Ig2 = im2gray(I);
Ig3 = im2gray(I);
Ig4 = im2gray(I);
% Zero Padding
pad_size = 10;
[rows,cols] = size(Ig);
I_padded = zeros(rows + 2 * pad_size, cols + 2 * pad_size);
I_padded(pad_size + 1: end - pad_size, pad_size + 1: end - pad_size) = Ig;
% Constant Padding
pad_size2 = 5;
constantValue = 128; %Constant Value
[rows2,cols2] = size(Ig2);
I_padded2 = constantValue * ones(rows2 + 2 * pad_size2, cols2 + 2 * pad_size2);
I_padded2(pad_size2 + 1: end - pad_size2, pad_size2 + 1: end - pad_size2) = Ig2;
% Reflective Padding
pad_size3 = 5;
[rows3,cols3] = size(Ig3);
I_padded3 = zeros(rows3 + 2 * pad_size3, cols3 + 2 * pad_size3);
I_padded3(1:pad_size3, pad_size3 + 1:end-pad_size3) = flipud(Ig3(1:pad_size3, :)); % Pad top and bottom
I_padded3(end-pad_size3+1:end, pad_size3 + 1:end-pad_size3) = flipud(Ig3(end-pad_size3+1:end, :));
I_padded3(pad_size3+1:end-pad_size3, 1:pad_size3) = fliplr(Ig3(:, 1:pad_size3)); % Pad left and right
I_padded3(pad_size3+1:end-pad_size3, end-pad_size3+1:end) = fliplr(Ig3(:, end-pad_size3+1:end));
I_padded3(pad_size3+1:end-pad_size3, pad_size3+1:end-pad_size3) = Ig3; % Fill the center
% Replicate Padding
pad_size4 = 5;
I_padded4 = padarray(Ig4,[pad_size4,pad_size4],'replicate','both');
figure
subplot(2,3,1), imshow(Ig), title('Original Image')
subplot(2,3,2), imshow(I_padded), title('Zero Padding')
subplot(2,3,3), imshow(I_padded2), title('Constant Padding')
subplot(2,3,4), imshow(I_padded3), title('Reflective Padding')
subplot(2,3,5), imshow(I_padded4), title('Replicate Padding')