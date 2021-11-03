%% MEM455 lAB3-2D POSE DETECTION
%% Function Description
% This function returns the location and orientation of the robot.
% Input: centroids of the robot and the different shapes (xyz).
% Output: (position, orientation) of the robot
% Note that orientation should be in degrees

function [pos, ori] = calculate_pose(xyz)
    % get the base origin template. This is given to you! The values in
    % base_xyz is your robot's reference pose.
    template_base = load('template_base.mat');
    base_xyz = template_base.xyz_base; % 1st column- robot, 2nd column- triangle, 3rd column-square, 4th column-circle
    
    % ---------------------- TODO for students -------------------------
    % Get position and orientation of the robot(base_1.PNG & base_2.PNG)
    % with respect to the reference pose, base_xyz
    relative = xyz - base_xyz(:,1)*[1 1 1 1];
    relative_base = base_xyz - base_xyz(:,1)*[1 1 1 1];
    pos = relative(1:3,1);
    rot_matrix = relative(:,3)*pinv(relative_base(:,3));
    ori = rotm2eul(rot_matrix);

    
    
    % ------------------------------------------------------------------

end