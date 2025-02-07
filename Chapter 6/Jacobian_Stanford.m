%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%  Screw-based Jacobian for Stanford manipulator (Wrist Point)
%  Case Study 6.9 in the book
%
clear all
syms('d2','d3','th1','th2','th4','th5','th6')
th3=pi/2;

R01=[cos(th1) 0 -sin(th1)
    sin(th1) 0 cos(th1) 
    0 -1 0];
R12=[cos(th2) 0 sin(th2)
    sin(th2) 0 -cos(th2) 
    0 1 0];
R23=[0 1 0
    -1 0 0
    0 0 1];
R34=[cos(th4) 0 -sin(th4)
    sin(th4) 0 cos(th4) 
    0 -1 0];
R45=[cos(th5) 0 sin(th5)
    sin(th5) 0 -cos(th5) 
    0 1 0];
R56=[cos(th6) -sin(th6) 0
    sin(th6)  cos(th6) 0 
    0 0 1];
R02=simplify(R01*R12);
R03=simplify(R02*R23);
R35=simplify(R34*R45);
R36=simplify(R35*R56);


R10=simplify(inv(R01));
R21=simplify(inv(R12));
R32=inv(R23);
R31=simplify(R32*R21);
R30=simplify(inv(R03));

z=[0;0;1];
s4=[0;0;1]; so4=[0;0;0];
s5=R34*z;
so5=so4+R34*[0;0;0];
s6=R35*z;
so6=so5+R35*[0;0;0];
s3=R32*z;
so3=so4-[0;0;d3];
s2=R31*z;
so2=so3-R32*[0;d2;0];
s1=R30*z;
so1=so2-R31*[0;0;0];

J1=[s1; cross(so1,s1)];
J2=[s2; cross(so2,s2)];
J3=[0;0;0; s3];
J4=[s4; cross(so4,s4)];
J5=[s5; cross(so5,s5)];
J6=[s6; cross(so6,s6)];

J=[J1 J2 J3 J4 J5 J6] 


 
