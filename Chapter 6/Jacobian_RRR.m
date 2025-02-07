%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides the Jacobian derivation of the 3R robot
%   with General and Screw methods
%% Parameter Definitions
clear; clc;
syms theta1 theta2 theta3 a1 a2 a3 real

%% DH Parameters
a=[a1;a2;a3]; al=[0;0;0]; d=[0;0;0];
% DH(a,alpha,d,theta)
% Homogeneous Transformation
T1=DH(a(1),al(1),d(1),theta1); T1=Matrix_Vpa(T1,4,4);  
R1=T1(1:3,1:3);
T2=DH(a(2),al(2),d(2),theta2); T2=Matrix_Vpa(T2,4,4);  
R2=T2(1:3,1:3);
T3=DH(a(3),al(3),d(3),theta3); T3=Matrix_Vpa(T3,4,4);  
R3=T3(1:3,1:3);
% Compound transformations
T12=simplify(T1*T2);        R12=T12(1:3,1:3);
T13=simplify(T12*T3);       R13=T13(1:3,1:3);

%% Jacobian Analysis
% Case Study 6.2 in the book
% General Jacobian: Iterative method

% Find End-Efector components by inspection
z0=[0;0;1];      % Direction of the first axis of rotation 
Pe3=[0;0;0];    % Consider the axis of final coordinate on the end-effector 
%
% Use iterative method 
% Formulation 6.25 in the book
%
for i=1:3;
  p(:,i)=[a(i)*cos(al(i)); a(i)*sin(al(i)); d(i)];
end
% Formulation 6.24 in the book
z1=R1*z0; z2=R12*z0; z3=R13*z0;
Pe2=Pe3+R13*p(:,3);
Pe1=Pe2+R12*p(:,2);
Pe0=Pe1+R1*p(:,1);

% General Jacobian Eq 6.20 in the book
disp('First column of General Jacobian matrix:')
J1=[simplify(cross(z0,Pe0)); z0]
J2=[simplify(cross(z1,Pe1)); z1];
J3=[simplify(cross(z2,Pe2)); z2];

J=[J1 J2 J3];
%   Type J on the command window to Visualize 
%   the Final General Jacobian Matrix of the robot
%
%% Jacobian Analysis
% Screw-based Jacobian: Iterative method
% Case Study 6.6 in the book

% Find End-Efector components by inspection
z=[0;0;1];      % Direction of first axis of rotation 
so4=[0;0;0];    % Consider the axis of final coordinate on the end-effector 
%
%   Iterative method 
% Formulation 6.38 in the book
%
for i=1:3;
  p(:,i)=[a(i); d(i)*sin(al(i)); d(i)*cos(al(i))];
end
% Formulation 6.37 in the book
s3=R12*z;   so3=so4-R13*p(:,3);
s2=R1*z;    so2=so3-R12*p(:,2);
s1=z;       so1=so2-R1*p(:,1);

% Screw-based Jacobian Eq 6.34 in the book
disp('First column of Screw-based Jacobian matrix:')
JS1=[s1; simplify(cross(so1,s1))]
JS2=[s2; simplify(cross(so2,s2))];
JS3=[s3; simplify(cross(so3,s3))];

JS=[JS1 JS2 JS3];
%   Type JS on the command window to Visualize 
%   the Final Screw-based Jacobian Matrix of the robot
%
