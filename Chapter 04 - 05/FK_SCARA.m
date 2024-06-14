%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the forward kinematic solution of the SCARA robot
%   with DH method
%% Parameter Definitions

clear;clc;
syms theta1 theta2 theta4 d1 d3 d4 a1 a2 real

%% DH Table
% Problem 3.3 on the book
% DH(a,alpha,d,theta)
T1=DH(a1, 0, d1, theta1); T1=Matrix_Vpa(T1,4,4);  % Homogeneous Transformation
T2=DH(a2, pi, 0, theta2); T2=Matrix_Vpa(T2,4,4);
T3=DH(0, 0, d3, 0);
T4=DH(0, 0, d4, theta4);  T4=Matrix_Vpa(T4,4,4);
% Calculate compound transformations
T12=simplify(T1*T2); T34=simplify(T4*T3);
T_Final=simplify(T12*T34);  % Final Homogeneous Transformation

%% Forward Kinematics
disp('Final End-Effector Position (DH method):')
P_DH=T_Final(1:3,4)        % Separate the position vector
disp('Final End-Effector Orientation (DH method):')
R_DH=T_Final(1:3,1:3)