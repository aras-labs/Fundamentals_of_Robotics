%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides the forward kinematic solution of the 3R robot
%   with DH and Screw methods
%% Parameter Definitions
clear all; clc; 
syms theta1 theta2 theta3 a1 a2 a3 real
%% DH Table: 
% Case Studies 4.1 and 4.6 on the book (Table 4.1 is used)
a=[a1;a2;a3]; al=[0;0;0]; d=[0;0;0];
% DH(a,alpha,d,theta)
T1=DH(a(1),al(1),d(1),theta1); % Homogeneous Transformation
T2=DH(a(2),al(2),d(2),theta2); 
T3=DH(a(3),al(3),d(3),theta3); 
% Calculate compound transformations
T_Final=T1*simplify(T2*T3);  % Final Homogeneous Transformation

%
%   Type T_final on the command window to Visualize 
%   the Final Homogeneous Transformation
%
%% Forward Kinematics
disp('Final End-Effector Position (DH method):')
P_DH=T_Final(1:3,4)        % Separate the position vector
R_DH=T_Final(1:3,1:3);      % and the rotation matrix of the End-Effector

%% Forward Kinematics (Screw-Based Analysis)
% Case Study 4.10 on the book (Table 4.6 is used)
%[S] = SR(s_x,s_y,s_z,s_ox,s_oy,s_oz,theta,d)
S1=SR(0,0,1,0,0,0,theta1,0);    % Screw-based Homogeneous Transformation  
S2=SR(0,0,1,a1,0,0,theta2,0);      
S3=SR(0,0,1,a1+a2,0,0,theta3,0);             
Screw=simplify(S1*simplify(S2*S3));       % Copmpound Transformation  

% Final Compound Transformation
%
%   Type Screw on the command window to Visualize 
%   the Final Screw-based Homogeneous Transformation
%
%%  Screw-based Forward Kinematics 
%
% position and orientation at initial state
%
U0=[1;0;0];V0=[0;1;0];W0=[0;0;1];E0=[a1+a2+a3;0;0];
S0=[U0,V0,W0,E0;
    0,0,0,1];           % Initial state HT
%
%   Screw-based Loop closure equation
%
S_Final=Screw*S0;
R_SR=S_Final(1:3,1:3);
P_SR=S_Final(1:3,4);
disp('Final End-Effector Poistion (Screw method):')
P_SR=simplify(P_SR)
%% Verification
% To show the two method reach to the same result
% see the difference of their honogeneous transformations)
disp(' The difference of End-Effector HT found by two methods:')
Error_T=simplify(S_Final-T_Final)
