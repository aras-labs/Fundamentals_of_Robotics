%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the kinematic details of the 6DOF Elbow manipulator
%% Parameter Definitions

clear; clc;
syms theta1 theta2 theta3 theta4 theta5 theta6 a2 a3 a4 d6 real

%% DH Table: 
% % Problem 4.7 Table 4.1
% DH(a,alpha,d,theta)
a=[0;a2;a3;a4;0;0];
al=[pi/2;0;0;-pi/2;pi/2;0];
d=[0;0;0;0;0;d6];
% Homogeneous Transformation
T1=DH(a(1),al(1),d(1),theta1); T1=Matrix_Vpa(T1,4,4);  
T2=DH(a(2),al(2),d(2),theta2); T2=Matrix_Vpa(T2,4,4);  
T3=DH(a(3),al(3),d(3),theta3); T3=Matrix_Vpa(T3,4,4);  
T4=DH(a(4),al(4),d(4),theta4); T4=Matrix_Vpa(T4,4,4);  
T5=DH(a(5),al(5),d(5),theta5); T5=Matrix_Vpa(T5,4,4);  
T6=DH(a(6),al(6),d(6),theta6); T6=Matrix_Vpa(T6,4,4);  
% Calculate compound transformations
T12=simplify(T1*T2);        R12=T12(1:3,1:3);
T13=simplify(T12*T3);       R13=T13(1:3,1:3);
T14=simplify(T13*T4);       R14=T14(1:3,1:3);
T15=simplify(T14*T5);       R15=T15(1:3,1:3);
T16=simplify(T15*T6);       R16=T16(1:3,1:3);
%% Forward Kinematics
disp('Final End-Effector Position (DH method):')
P_DH=T16(1:3,4);
R_DH=T16(1:3,1:3);
%% Forward Kinematics (Screw-Based Analysis)
% Problem 3.11 on the book (Table 3.7 is used)
%[S] = SR(s_x,s_y,s_z,s_ox,s_oy,s_oz,theta,d)
S1=SR(0,0,1,0,0,0,theta1,0);    % Screw-based Homogeneous Transformation         
S2=SR(0,-1,0,0,0,0,theta2,0);       
S3=SR(0,-1,0,a2,0,0,theta3,0);      
S4=SR(0,-1,0,a2+a3,0,0,theta4,0);   
S5=SR(0,0, 1,a2+a3+a4,0,0,theta5,0);
S6=SR(1,0,0,0,0,0,theta6,0);        
S12=simplify(S1*S2);    S13=simplify(S12*S3);               
S14=simplify(S13*S4);   S15=simplify(S14*S5);               
S16=simplify(S15*S6);               
Screw=simplify(S16);    % Copmpound Transformation                
% Final Compound Transformation
%
%   Type Screw on the command window to Visualize 
%   the Final Screw-based Homogeneous Transformation
%
%%  Screw-based Forward Kinematics 
%
% position and orientation at initial state
%
U0=[0;0;1];V0=[0;-1;0];W0=[1;0;0];P0=[a2+a3+a4+d6;0;0];
S0=[U0,V0,W0,P0;
    0,0,0,1];   % Initial state HT
%
%   Screw-based Loop closure equation
% 
S_Final=Screw*S0;
R_SR=S_Final(1:3,1:3);
P_SR=S_Final(1:3,4);
disp('Final End-Effector Poistion (Screw method):')
P_SR=simplify(P_SR)