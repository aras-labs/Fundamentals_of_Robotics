%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides Trajectory planning of 2R Robot
%   By Cubic Polynomials with via point
%   Case Study 10.2 
%
%% Parameter Definitions
clear all, clc; clf;

%   Initial and final conditions

q0=[10 120];
qf=[120 90];
w0=[0 20];
wf=[20 0];

%   Defining time and trajectories
tf=2;
t1=0:0.01:tf;t1=t1'; 
t2=tf:0.01:2*tf;t2=t2';
p(1,:)=q0; p(2,:)=w0;
p(3,:)=3/tf^2*(qf-q0)-1/tf*(2*w0+wf);
p(4,:)=-2/tf^3*(qf-q0)+1/tf^2*(w0+wf);

q= p(1,:) + p(2,:).*t1 + p(3,:).*t1.^2+p(4,:).*t1.^3;
dq= p(2,:)+ 2*p(3,:).*t1+3*p(4,:).*t1.^2;
ddq= 2*p(3,:)+6*p(4,:).*t1;

%%   Final trajectory in joint space
%   Figure 10.5 of the book
subplot(3,1,1)
plot(t1,q(:,1),'b',t2,q(:,2),'k'),grid
ylabel('\theta   deg')
subplot(3,1,2)
plot(t1,dq(:,1),'b',t2,dq(:,2),'k'),grid
ylabel('\omega   deg/s')
subplot(3,1,3)
plot(t1,ddq(:,1),'b',t2,ddq(:,2),'k'),grid
ylabel('\alpha   deg/s^2'),xlabel('time(sec)')
set(findall(figure(1),'type','line'),'linewidth',2)


