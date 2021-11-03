%% MEM455 LAB3-2D POSE DETECTION
%% Function Description
% Given a fIducial image binary, this function returns the locations. 
% Check for poseTracking.m for binarization of each different shapes.
% Input: binary image
% Output: centroid (xyz position) of the robot, triangle, square, and
% circle as a single matrix(IN THIS ORDER). Make sure your columns are in the correct
% order.

function [xyz] = fiducial_xyz(img_binary)
    global_threshold = 0.1;
    % get properties
    s = regionprops(img_binary, 'Centroid', 'Area', 'Circularity', 'Perimeter');

    % metric to get different shapes
    xyz = zeros(3,4);% 1st column- robot, 2nd column- triangle, 3rd column-square, 4th column-circle
    xyz(1:2,1) = s(1).Centroid; % centroid of the robot
    
    for i = 2:length(s)
        
        % ---------------------- TODO for students -------------------------
        % metrics to identify triangles and squares. DO NOT MANUALLY assign
        % values to xyz 
        if isSquare(s(i),global_threshold)
            xyz(1:2,3) = s(i).Centroid;
        elseif isCircle(s(i),global_threshold)
            xyz(1:2,4) = s(i).Centroid;
        else
            xyz(1:2,2) = s(i).Centroid;
        end
        
        % ------------------------------------------------------------------
        
        % circle, this is given to you.
%         m = s(i).Circularity;
%         if((m < 1.1) && (m > 0.9))
%             xyz(1:2,4) = s(i).Centroid;
%         end
        
    end 
    
end

function tf = isSquare(s,threshold)
    index = (s.Perimeter/4)^2/s.Area;
    if abs(index-1) < threshold
        tf=true;
    else
        tf=false;
    end
end

function tf = isCircle(s,threshold)
     index = 4*pi*s.Area/(s.Perimeter^2);
     if abs(index-1) < threshold
        tf=true;
     else
        tf=false;
     end
end