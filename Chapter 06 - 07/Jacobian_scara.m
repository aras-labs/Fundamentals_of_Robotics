%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the Screw-based Jacobian derivation of 
%   the 6DOF Elbow manipulator in three different frames
%% Parameter Definitions
clear all, clc
syms('d1','d3','d4','a1','a2','th1','th2','th4')
syms('p1','p2','p3','p4','pp1','pp2','pp3','pp4') 
syms('J1','J2','J3','J4','J') 
d2=0;a3=0;a4=0;th3=0;
% Rotation matrices
R1=[cos(th1) -sin(th1) 0
    sin(th1) cos(th1) 0
    0 0 1];
R2=[cos(th2) sin(th2) 0
    sin(th2) -cos(th2) 0
    0 0 -1];
R4=[cos(th4) -sin(th4) 0
    sin(th4) cos(th4) 0
    0 0 1];
R12=R1*R2;
R124=R12*R4;
R21=simplify(inv(R12));
%%
%    General Jacobian matrix components
%
z0=[0;0;1]; z1=z0;
z2=-z0; z3=z2;
p4=[0;0;-d4];
p3=R124*[0;0;d3]+p4;
p2=simplify(R12*[a2;0;0]+p3);
p1=simplify(R1*[a1;0;d1]+p2);

J3=cross(z2,p3);
J2=cross(z1,p2);
J1=cross(z0,p1);

disp('SCARA Jacobian matrix:')
J=[J1 J2 z2 J3
    z1 z2 0*z3 z3]
