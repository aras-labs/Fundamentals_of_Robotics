%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the forward kinematic solution of the 3R robot
%   with DH and Screw methods
%% Parameter Definitions
clear; clc; clear all
syms th1 th2 th3 a1 a2 a3 real
a=[a1;a2;a3]; al=[0;0;0]; d=[0;0;0];

% Find Rotation Matrices by inspection
R01=[cos(th1) -sin(th1) 0
    sin(th1) cos(th1) 0
    0 0 1];
R12=[cos(th2) -sin(th2) 0
    sin(th2) cos(th2) 0
    0 0 1];
R23=[cos(th3) -sin(th3) 0
    sin(th3) cos(th3) 0
    0 0 1];
R02=simplify(R01*R12);
R03=simplify(R02*R23);
R10=simplify(inv(R01));
R21=simplify(inv(R12));
R20=simplify(inv(R02));
R30=simplify(inv(R03));


%% General Jacobian
% Find Jacobian column components by inspection 

% Find End-Efector cmponents by inspection
z0=[0;0;1];      % Direction of the first axis of rotation 
z1=z0; z2=z0;

Pe2=R03*[a3;0;0];   
Pe1=Pe2+R02*[a2;0;0];
Pe0=Pe1+R01*[a1;0;0];

% General Jacobian Eq 4.19 in the book
disp('First column of General Jacobian matrix:')
J1=[simplify(cross(z0,Pe0)); z0]
J2=[simplify(cross(z1,Pe1)); z1];
J3=[simplify(cross(z2,Pe2)); z2];

J=[J1 J2 J3];
%   Type J on the command window to Visualize 
%   the Final General Jacobian Matrix of the robot

%%  Screw-based Jacobian
% Find Jacobian column components by inspection 
s1=[0;0;1]; s2=s1; s3=s1;
so3=R03*[-a3;0;0];
so2=so3+R02*[-a2;0;0];
so1=so2+R01*[-a1;0;0];

disp('First column of Screw-based Jacobian matrix:')
JS1=[s1; simplify(cross(so1,s1))]
JS2=[s2; simplify(cross(so2,s2))];
JS3=[s3; simplify(cross(so3,s3))];

JS=[JS1 JS2 JS3];

