%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the Isortrpic analysis of 2R manipulator
%
%% Parameter Definitions
clear; clc;
syms x th2 real
a1=sqrt(2); a2=1; k=10^3;

%   Jacobian analysis:  symbolic
%   Problem 4.13 in the book
J=[a1*sin(th2)  0; a1*cos(th2)+a2 a2];  % Jacobian matrix in symbolic form
JJ=simplify(J*J');
p=x*eye(2,2)-JJ;
D=simplify(det(p));
lambda=simplify(solve(D==0,x));         % Jacobian matrix eigenvalue 

%   Jacobian analysis: numeric
%   Problem 4.14 in the book
J1=[sqrt(2) , 0; 1 1];
JJ1=J1*J1'; 
[U,S,V]=svd(J1);        % singular value decomposition of Jacobian
[v1,e1]=eig(JJ1);       % eigenvalues of JJ'

%   Stiffness analysis: numeric
C=J1*J1'/k;
[U,S,V]=svd(C)
[v,e]=eig(C'*C)

%   Problem 4.15 in the book
th2=0:0.01:pi;
alpha=[0.707; 1; 1.2; 1.8];
for i=1:4;
kappa(:,i)=2*sin(th2)./(1/alpha(i)+2*alpha(i)+2*cos(th2));
end
%   Figure 4.26 in the book
plot(th2/pi,kappa(:,1),'-k', th2/pi,kappa(:,2),'--', ... 
th2/pi,kappa(:,3),'-.', th2/pi,kappa(:,4),'m:')
set(findall(figure(1),'type','line'),'linewidth',2)
grid on
legend('\alpha=0.707',  '\alpha=1, 0.5', '\alpha=1.2, 0.417', ...
    '\alpha=1.8, 0.278')
xlabel('\theta_2/\pi')
ylabel('\kappa')

