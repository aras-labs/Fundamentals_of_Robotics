%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides Dynamics formulation of SCARA robot
%   Case Studies 8.4 and 9.3 (Christoffel Matrix)
%
%% Parameter Definitions
clear all, clc

%   Defining symbolic variables:
n=3;
th=sym('th',[n 1]);assume(th,'real');
dth=sym('dth',[n 1]);assume(dth,'real');
a=sym('a',[n 1]);assume(a,'real');
m=sym('m',[n 1]); assume(m,'real');
I=sym('I',[n 1]);assume(I,'real');
g=sym('g'); assume(g,'real');
l=sym('l'); assume(l,'real');
d1=sym('l'); assume(d1,'real');
tau=sym('tau',[n 1]);assume(tau,'real');
I1=m(1)*a(1)^2/12*eye(3,3);I1(1,1)=0;
I2=m(2)*a(2)^2/12*eye(3,3);I2(1,1)=0;
I3=m(3)*a(3)^2/12*eye(3,3);I3(1,1)=0;

%   Defining parametric variables:
z=[0;0;1];
bg=g*[0;0;-1];   % g along -z direction
z1=z;z2=-z;z3=-z;

% link's center of mass
pc1=sym('pc1',[3 n-2]);
pc2=sym('pc2',[3 n-1]);
pc3=sym('pc3',[3 n]);

pc1(:,1)=0.5*a(1)*[cos(th(1)); sin(th(1)); 0];
pc2(:,2)=0.5*a(2)*[cos(th(1)+th(2)); sin(th(1)+th(2)); 0];
pc2(:,1)=[a(1)*cos(th(1)) + 0.5*a(2)*cos(th(1)+th(2));
          a(1)*sin(th(1)) + 0.5*a(2)*sin(th(1)+th(2)); 
          0];
pc3(:,3)=[0;0;th(3)-l/2];
pc3(:,2)=[a(2)*cos(th(1)+th(2));a(2)*sin(th(1)+th(2)); 
          -th(3)+l/2];
pc3(:,1)=[a(1)*cos(th(1))+a(2)*cos(th(1)+th(2));
          a(1)*sin(th(1))+a(2)*sin(th(1)+th(2)); 
          d1-th(3)+l/2];

% link's Jacobian matrices
Jv1=[cross(z1,pc1(:,1)) 0*z 0*z];
Jv2=[cross(z1,pc2(:,1)) cross(z2,pc2(:,2)) 0*z];
Jv3=[cross(z1,pc3(:,1)) cross(z2,pc3(:,2)) z1];

Jw1=[z1 0*z 0*z]; Jw2=[z1 z2 0*z]; Jw3=[z1 z2 0*z3];

%%   Lagrange Formulation
%   Mass Matrix

disp('Mass matrix of SCARA robot (Lagrange method):')
M= simplify(m(1)*Jv1'*Jv1+Jw1'*I1*Jw1 + ...
            m(2)*Jv2'*Jv2+Jw2'*I2*Jw2 + ...
            m(3)*Jv3'*Jv3+Jw3'*I3*Jw3)

%   Gravity Vector
disp('Gravity Vector of SCARA robot (Lagrange method):')
P=simplify(-m(1)*bg'*pc1(:,1) -m(2)*bg'*pc2(:,1) -m(3)*bg'*pc3(:,1));
G=simplify(jacobian(P,th)')

%    Coriolis and centrifugal vector
c1=simplify([jacobian(M(:,1),th)*dth, jacobian(M(:,2),th)*dth , ...
                                        jacobian(M(:,3),th)*dth]*dth);
c2=simplify(jacobian(dth'*M*dth,th)')/2;
disp('Coriolis and centrifugal vector of SCARA robot (Lagrange method):')
c=simplify(c1-c2);


% Christoffel Matrix
dM=[simplify(jacobian(M(1,:),th(1))), ...
    simplify(jacobian(M(2,:),th(1))), ...
    simplify(jacobian(M(3,:),th(1)));
    simplify(jacobian(M(1,:),th(2))), ...
    simplify(jacobian(M(2,:),th(2))), ...
    simplify(jacobian(M(3,:),th(2)));
    simplify(jacobian(M(1,:),th(3))), ...
    simplify(jacobian(M(2,:),th(3))), ...
    simplify(jacobian(M(3,:),th(3))); 
    ];
V=simplify(dM'*kron(eye(3,3),dth));
U=simplify(kron(eye(3,3),dth')*dM);
disp('Christoffel Matrix of SCARA robot (Lagrange method):')
C=simplify((V+U'-U)/2)

%% Verification
% Check if c is equal to C\dot{q}
disp('Check if c is equal to C\dot{q}:')
Ec=simplify(c-C*dth)

% Check if \dot{m}-2C is skew-symmetric
disp('Check if \dot{m}-2C is skew-symmetric:')
MdC=simplify(V-2*C)


