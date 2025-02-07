%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides Trajectory planning of 2R Robot
%   By Linear with parabolic blend
%   Case Study 10.4
%
%% Parameter Definitions

clear all, clc; clf;

%   Initial and final conditions

a=[1; 0.707];
q0=[10 -10]; 
qf=[90 -45];
omax=30;amax=40;
%   Defining time and trajectories
tf=4;ts=0.01;
tb=omax/amax;
Omega=(qf-q0)/(tf-tb);
alpha=Omega/tb;

t=0:ts:tf;t=t'; 
t1=0:ts:tb;t1=t1';
t2=tb+ts:ts:tf-tb; t2=t2';
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

% Convert degrees to radians
th=q*pi/180; dth=dq*pi/180; d2th=d2q*pi/180;

% Folve Forward kinematics

%Link 1
x1=a(1)*cos(th(:,1));
y1=a(1)*sin(th(:,1));

%End Effector
x=a(1)*cos(th(:,1))+ a(2)*cos(th(:,1)+th(:,2));
y=a(1)*sin(th(:,1))+ a(2)*sin(th(:,1)+th(:,2));

xp=[0 x1(1) x(1);
    0 x1(51) x(51);
    0 x1(101) x(101);
    0 x1(151) x(151);
    0 x1(201) x(201);
    0 x1(251) x(251);   
    0 x1(301) x(301);
    0 x1(351) x(351);
    0 x1(401) x(401);
];
yp=[0 y1(1) y(1);
    0 y1(51) y(51)
    0 y1(101) y(101)
    0 y1(151) y(151)
    0 y1(201) y(201)
    0 y1(251) y(251)
    0 y1(301) y(301)
    0 y1(351) y(351)
    0 y1(401) y(401)
    ]; 

%%   Final trajectory in task space
%   
figure(1)
plot(x1,y1,'-.k', x,y,'k', ...
    xp(1,:),yp(1,:), '-o', xp(2,:),yp(2,:), '-o', ...
    xp(3,:),yp(3,:), '-o', xp(4,:),yp(4,:), '-o', ...
    xp(5,:),yp(5,:), '-o', xp(6,:),yp(6,:), '-o', ...
    xp(7,:),yp(7,:), '-o', xp(8,:),yp(8,:), '-o', ...
    xp(9,:),yp(9,:), '-o')
set(findall(figure(1),'type','line'),'linewidth',2)
%axis([-0.2 1.8 0 2])
grid
xlabel('x (m)'), ylabel('y (m)')

%%   Final trajectory in joint space
%   Figure 10.8 of the book
figure(2)
subplot(1,3,1)
plot(t,q(:,1),'b', t,q(:,2),'-.k'), grid
ylabel('\theta (degrees)'), legend('q_1', 'q_2')
subplot(1,3,2)
plot(t,dq(:,1),'b', t,dq(:,2),'-.k'), grid
xlabel('time (sec)'), ylabel(' \omega (degrees/s)')
subplot(1,3,3)
plot(t,d2q(:,1),'b', t,d2q(:,2),'-.k'), grid
ylabel('\alpha (degrees/s^2)')
set(findall(figure(2),'type','line'),'linewidth',2)
