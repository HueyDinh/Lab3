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
    shape = 2;
    xyz_rel = xyz - xyz(:,1)*[1 1 1 1];
    fiducial_rel = base_xyz - base_xyz(:,1)*[1 1 1 1];
    pos = xyz_rel(1:3,1);
    rot_matrix = xyz_rel(:,shape) * pinv(fiducial_rel(:,shape));
    axis_rot = rotm2axang(rot_matrix + [0 0 0;0 0 0;0 0 1]);
    axis_mag = axis_rot(4);
    axis_dir = axis_rot(3);
    ori = axis_mag*axis_dir;
    
    % ------------------------------------------------------------------

end