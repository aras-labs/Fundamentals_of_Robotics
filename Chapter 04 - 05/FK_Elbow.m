%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the forward kinematic solution of the Elbow manipulator
%   with DH and Screw methods
%% Parameter Definitions

clear;clc;
syms theta1 theta2 theta3 d1 a2 a3 real

%% DH Table
% Problem 3.2 on the book
% DH(a,alpha,d,theta)
T1=DH(0,pi/2,d1,theta1);     % Homogeneous Transformation
T2=DH(a2,0,0,theta2);
T3=DH(a3,0,0,theta3);
T1=Matrix_Vpa(T1,4,4);       % Remove very small coefficients
T_Final=T1*simplify(T2*T3);  % Final Homogeneous Transformation
%
%   Type T_final on the command window to Visualize 
%   the Final Homogeneous Transformation
%
%% Forward Kinematics
disp('Final End-Effector Position (DH method):')
P_DH=T_Final(1:3,4)
R_DH=T_Final(1:3,1:3);
%% Forward Kinematics (Screw-Based Analysis)
% Problem 3.10 on the book (Table 3.6 is used)
%
%[S] = SR(s_x,s_y,s_z,s_ox,s_oy,s_oz,theta,d)
S1=SR(0,0,1,0,0,0,theta1,0);    % Screw-based Homogeneous Transformation
S2=SR(0,-1,0,0,0,d1,theta2,0);
S3=SR(0,-1,0,a2,0,d1,theta3,0);
Screw=simplify(S1*simplify(S2*S3)); % Copmpound Transformation  

% Final Compound Transformation
%
%   Type Screw on the command window to Visualize 
%   the Final Screw-based Homogeneous Transformation

%%  Screw-based Forward Kinematics 
%
% position and orientation at initial state
%
U0=[1;0;0];V0=[0;0;1];W0=[0;-1;0];P0=[a2+a3;0;d1];
S0=[U0,V0,W0,P0;
    0,0,0,1];    % Initial state HT
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
