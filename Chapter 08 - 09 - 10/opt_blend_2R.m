%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides Trajectory planning of 2R Robot
%   By Linear with parabolic blend (Time optimal)
%   Problem 5.16 
%
%% Parameter Definitions
clear all, clc; clf;

%   Initial and final conditions

a=[1; 0.707];
q0=[10 -10]; 
qf=[90 -45];
eta=((qf(2)-q0(2))/(qf(1)-q0(1)));
omax=30;amax=40;

%   Defining time and trajectories
tf=1/omax*(qf(1)-q0(1))+omax/amax;
%tf=round(tf,2);
ts=0.01;
tb=omax/amax;
Omega=omax*[1 eta];
alpha=amax*[1 eta];


t=0:ts:tf;t=t'; 
t1=0:ts:tb;t1=t1';
t2=tb+ts:ts:tf-tb;, t2=t2';
t3=tf-tb+ts:ts:tf;t3=t3';
q=[q0+1/2*alpha.*t1.^2
    q0+Omega.*(t2-tb/2)
    q0+Omega.*(t3-1/2*tb)-1/2*alpha.*(t3-tf+tb).^2];
dq= [alpha.*t1
    Omega.*ones(size(t2))
    Omega-alpha.*(t3-tf+tb)];
d2q=[alpha+zeros(size(t1))
    alpha.*zeros(size(t2))
    -alpha+zeros(size(t3))];

%%   Final trajectory in joint space
%   Figure 5.18 of the book
figure(1)
subplot(1,3,1)
plot(t,q(:,1),'b', t,q(:,2),'-.k'), grid
ylabel('\theta (degrees)'), legend('q_1', 'q_2')
subplot(1,3,2)
plot(t,dq(:,1),'b', t,dq(:,2),'-.k'), grid
xlabel('time (sec)'), ylabel(' \omega (degrees/s)')
subplot(1,3,3)
plot(t,d2q(:,1),'b', t,d2q(:,2),'-.k'), grid
ylabel('\alpha (degrees/s^2)')
set(findall(figure(1),'type','line'),'linewidth',2)

