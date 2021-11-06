%% MEM455 lAB3-2D POSE DETECTION
%% Detection
% convert the image to grayscale
image = 'base_1.PNG';
img_rbg = imread(image);
img_gray = rgb2gray(img_rbg);
img_binary = imbinarize(img_gray);
img_binary = imcomplement(img_binary);
% for detection. ex.
xyz = fiducial_xyz(img_binary)
[pos, ori] = calculate_pose(xyz)