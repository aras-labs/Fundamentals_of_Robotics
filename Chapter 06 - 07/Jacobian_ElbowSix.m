%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the Screw-based Jacobian derivation of 
%   the 6DOF Elbow manipulator in three different frames
%% Parameter Definitions

clear;  clc;
syms theta1 theta2 theta3 theta4 theta5 theta6 a2 a3 a4 d6 real
%% DH Table
% Problem 4.7 Table 4.1
% DH(a,alpha,d,theta)
a=[0;a2;a3;a4;0;0];
al=[pi/2;0;0;-pi/2;pi/2;0];
d=[0;0;0;0;0;d6];
% Homogeneous Transformation
T01=DH(a(1),al(1),d(1),theta1); T01=Matrix_Vpa(T01,4,4);  
R01=T01(1:3,1:3);
T12=DH(a(2),al(2),d(2),theta2); T12=Matrix_Vpa(T12,4,4);  
R12=T12(1:3,1:3);
T23=DH(a(3),al(3),d(3),theta3); T23=Matrix_Vpa(T23,4,4);  
R23=T23(1:3,1:3);
T34=DH(a(4),al(4),d(4),theta4); T34=Matrix_Vpa(T34,4,4);  
R34=T34(1:3,1:3);
T45=DH(a(5),al(5),d(5),theta5); T45=Matrix_Vpa(T45,4,4);  
R45=T45(1:3,1:3);
T56=DH(a(6),al(6),d(6),theta6); T56=Matrix_Vpa(T56,4,4);  
R56=T56(1:3,1:3);
% Calculate compound transformations
T02=simplify(T01*T12);       R02=T02(1:3,1:3);
T03=simplify(T02*T23);       R03=T03(1:3,1:3);
T04=simplify(T03*T34);       R04=T04(1:3,1:3);
T05=simplify(T04*T45);       R05=T05(1:3,1:3);
T06=simplify(T05*T56);       R06=T06(1:3,1:3);
%% Find the inverse rotation matrices by their transpose:
R44=eye(3,3);
R43=R34'; R32=R23'; R21=R12'; R10=R01';
% Calculate compound transformations of inverse matrices
R42=simplify(R43*R32);
R41=simplify(R42*R21);
R40=simplify(R41*R10);
R31=simplify(R32*R21);
R30=simplify(R31*R10);

%% Jacobian Analysis
% Problem 4.7 
% Screw-based Jacobian: Iterative method
% Find End-Efector cmponents by inspection
z=[0;0;1];      % Direction of first axis of rotation 
so7=[0;0;0];    % Consider the axis of final coordinate on the end-effector 
%
%   Iterative method 
% Formulation 4.38 in the book
%
for i=1:6;
  p(:,i)=[a(i); d(i)*sin(al(i)); d(i)*cos(al(i))];
end
% Formulation 4.37 in the book 
s6=R05*z;   so6=so7-R06*p(:,6);
s5=R04*z;   so5=so6-R05*p(:,5);
s4=R03*z;   so4=so5-R04*p(:,4);
s3=R02*z;   so3=so4-R03*p(:,3);
s2=R01*z;   so2=so3-R02*p(:,2);
s1=z;       so1=so2-R01*p(:,1);

J1=[s1; simplify(cross(so1,s1))];
J2=[s2; simplify(cross(so2,s2))];
J3=[s3; simplify(cross(so3,s3))];
J4=[s4; simplify(cross(so4,s4))];
J5=[s5; simplify(cross(so5,s5))];
disp('Last column of Screw-based Jacobian matrix:')
J6=[s6; simplify(cross(so6,s6))]

J=[J1 J2 J3 J4 J5 J6];
%   Type JS on the command window to Visualize 
%   the Final Screw-based Jacobian Matrix of the robot
%
%% Jacobian Matrix with reference to frame{4}
% Problem 4.8 

so5=[0;0;0]; 
s4=R43*z; so4=so5-R44*p(:,4);
s3=R42*z; so3=so4-R43*p(:,3);
s2=R41*z; so2=so3-R42*p(:,2);
s1=R40*z; so1=so2-R41*p(:,1);

disp('First column of Screw-based Jacobian matrix w.r.t frame Four:')
JF1=[s1; simplify(cross(so1,s1))]
JF2=[s2; simplify(cross(so2,s2))];
JF3=[s3; simplify(cross(so3,s3))];
JF4=[s4; simplify(cross(so4,s4))];

JF=[JF1 JF2 JF3 JF4];
%   Type JF on the command window to Visualize 
%   the Final Screw-based Jacobian Matrix of the robot 
%   w.r.t. frame four
%
%% Jacobian Matrix with reference to frame{3}

so4=[0;0;0]; 
s3=R32*z; so3=so4-p(:,3);
s2=R31*z; so2=so3-R32*p(:,2);
s1=R30*z; so1=so2-R31*p(:,1);

disp('First column of Screw-based Jacobian matrix w.r.t frame Three:')
JT1=[s1; simplify(cross(so1,s1))]
JT2=[s2; simplify(cross(so2,s2))];
JT3=[s3; simplify(cross(so3,s3))];
JT=[JT1 JT2 JT3];

%   Type JT on the command window to Visualize 
%   the Final Screw-based Jacobian Matrix of the robot
%   w.r.t. frame three
%
