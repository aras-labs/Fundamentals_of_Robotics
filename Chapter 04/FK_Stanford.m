%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides the forward kinematic solution of the Stanford
%   with DH and Screw methods
%% Parameter Definitions
clear;
clc;
syms theta1 theta2 theta3 theta4 theta5 theta6 d2 d3 d6 real

%% DH Table: 
% Case Studies 4.4 and 4.9 on the book (Table 4.4 is used)
% [T] = DH(a,alpha,d,theta) % Homogeneous Transformation
T1=DH(0,-pi/2,0, theta1);    T1=Matrix_Vpa(T1,4,4);
T2=DH(0,pi/2,d2,theta2);    T2=Matrix_Vpa(T2,4,4);
T3=DH(0,0,d3,0);            T3=Matrix_Vpa(T3,4,4);
T4=DH(0,-pi/2,0,theta4);    T4=Matrix_Vpa(T4,4,4);
T5=DH(0,pi/2,0,theta5);     T5=Matrix_Vpa(T5,4,4);
T6=DH(0,0,d6,theta6);       T6=Matrix_Vpa(T6,4,4);
% Calculate compound transformations
T12=simplify(T1*T2);
T13=simplify(T12*T3);
T45=simplify(T4*T5);
T46=simplify(T45*T6);
% Final Homogeneous Transformation
T_Final=simplify(T13*T46);  T_Final=Matrix_Vpa(T_Final,4,4);
%
%   Type T_final on the command window to Visualize 
%   the Final Homogeneous Transformation
%
disp('Final wrist Position (DH method):')
P_DH=T13(1:3,4)        % Separate the position vector
R_DH=T13(1:3,1:3);      % and the rotation matrix of the End-Effector

%% Forward Kinematics (Screw-Based Analysis)
% Case Study 4.13 on the book (Table 4.9 is used)
%[S] = SR(s_x,s_y,s_z,s_ox,s_oy,s_oz,theta,d)
S1=SR(0,0,1,0,0,0,theta1,0);    % Screw-based Homogeneous Transformation 
S2=SR(0,1,0,0,0,0,theta2,0);
S3=SR(0,0,1,0,d2,0,0,d3);
S4=SR(0,0,1,0,d2,0,theta4,0);
S5=SR(0,1,0,0,d2,0,theta5,0);
S6=SR(0,0,1,0,d2,0,theta6,0);
S12=simplify(S1*S2);            % Copmpound Transformation  
S13=simplify(S12*S3);
% Final Compound Transformation
%
%   Type Screw on the command window to Visualize 
%   the Final Screw-based Homogeneous Transformation
% position and orientation at initial state
%
U0=[1;0;0];V0=[0;1;0];W0=[0;0;1];P0=[0;d2;0];Ze=[0,0,0];
S0=[U0,V0,W0,P0;Ze,1];
%
%   Screw-based Loop closure equation
%
S_Final=S13*S0;
R_SR=S_Final(1:3,1:3);
P_SR=S_Final(1:3,4);
disp('Final Wrist Poistion (Screw method):')
P_SR=simplify(P_SR)
%% Verification
% To show the two method reach to the same result
% see the difference of their honogeneous transformations)
disp(' The difference of Wrist position found by two methods:')
Error_T=simplify(P_SR-P_DH)
