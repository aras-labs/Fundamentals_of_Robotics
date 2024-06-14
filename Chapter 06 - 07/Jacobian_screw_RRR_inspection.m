%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%  Conventional Jacobian for RRR robot
%  By inspection (about frame{0}
%
clear all
syms('a1','a2','a3', 'th1','th2','th3')

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

s1=[0;0;1]; s2=s1; s3=s1;
so3=R03*[-a3;0;0];
so2=so3+R02*[-a2;0;0];
so1=so2+R01*[-a1;0;0];

J1=[cross(so1,s1)];
J2=[cross(so2,s2)];
J3=[cross(so3,s3)];

J00=[s1 s2 s3 
    J1 J2 J3]

s1=[0;0;1]; s2=s1; s3=s1;
so3=[0;0;0];
so2=so3+R02*[-a2;0;0];
so1=so2+R01*[-a1;0;0];

J1=[cross(so1,s1)];
J2=[cross(so2,s2)];
J3=[cross(so3,s3)];

J02=[s1 s2 s3 
    J1 J2 J3]
