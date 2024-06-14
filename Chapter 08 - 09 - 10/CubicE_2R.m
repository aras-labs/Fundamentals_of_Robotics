%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides Trajectory planning of 2R Robot 
%   in Cartesian Space by Cubic Polynomials 
%   Problem 5.12 
%
%% Parameter Definitions

clear all, clc; clf;

%   Initial and final conditions

a=[1; 0.707];
q0=[10 -10]; th0=q0*pi/180;
qf=[90 -45]; thf=qf*pi/180;

%End Effector
x0=[a(1)*cos(th0(1))+ a(2)*cos(th0(1)+th0(2)), ...
    a(1)*sin(th0(1))+ a(2)*sin(th0(1)+th0(2))];
xf=[a(1)*cos(thf(1))+ a(2)*cos(thf(1)+thf(2)), ...
    a(1)*sin(thf(1))+ a(2)*sin(thf(1)+thf(2))];

%   Defining time and trajectories
tf=4;
t=0:0.01:tf;t=t'; n=max(size(t));
t2=t.^2; t3=t.^3;
x= x0 + 3/tf^2*(xf-x0).*t2 -2/tf^3*(xf-x0).*t3;
dx=  6/tf^2*(xf-x0).*t -6/tf^3*(xf-x0).*t2;
d2x= 6/tf^2*(xf-x0)-12/tf^3*(xf-x0).*t;

% Solve Inverse inematics

C2=(x(:,1).^2 + x(:,2).^2 - (a(1)^2+a(2)^2))/(2*a(1)*a(2));
th2=-acos(C2);
b1=a(1)+a(2)*cos(th2);
b2=a(2)*sin(th2);
th1=atan2(x(:,2),x(:,1))-atan2(b2,b1);

th=[th1 th2];
q=th*180/pi;
%Link 1
x1=a(1)*cos(th(:,1));
y1=a(1)*sin(th(:,1));

%End Effector
xe=a(1)*cos(th(:,1))+ a(2)*cos(th(:,1)+th(:,2));
ye=a(1)*sin(th(:,1))+ a(2)*sin(th(:,1)+th(:,2));

xp=[0 x1(1) xe(1);
    0 x1(51) xe(51);
    0 x1(101) xe(101);
    0 x1(151) xe(151);
    0 x1(201) xe(201);
    0 x1(251) xe(251);   
    0 x1(301) xe(301);
    0 x1(351) xe(351);
    0 x1(401) xe(401);
];
yp=[0 y1(1) ye(1);
    0 y1(51) ye(51)
    0 y1(101) ye(101)
    0 y1(151) ye(151)
    0 y1(201) ye(201)
    0 y1(251) ye(251)
    0 y1(301) ye(301)
    0 y1(351) ye(351)
    0 y1(401) ye(401)
    ]; 

%%   Final trajectory in task space
%   Figure 5.21 of the book
figure(1)
plot(x1,y1,'-.k', xe,ye,'k', ...
    xp(1,:),yp(1,:), '-o', xp(2,:),yp(2,:), '-o', ...
    xp(3,:),yp(3,:), '-o', xp(4,:),yp(4,:), '-o', ...
    xp(5,:),yp(5,:), '-o', xp(6,:),yp(6,:), '-o', ...
    xp(7,:),yp(7,:), '-o', xp(8,:),yp(8,:), '-o', ...
    xp(9,:),yp(9,:), '-o')
set(findall(figure(1),'type','line'),'linewidth',2)
%axis([-0.2 1.8 0 2])
grid on
xlabel('x (m)'), ylabel('y (m)')

%%   Final trajectory in task space
%   Link Components
subplot(1,3,1)
plot(t,x(:,1),'b', t,x(:,2),'-.k'), grid
ylabel('position (m)'), legend('x_e', 'y_e')
subplot(1,3,2)
plot(t,dx(:,1),'b', t,dx(:,2),'-.k'), grid
xlabel('time (sec)'), ylabel('velocity (m/s)')
subplot(1,3,3)
plot(t,d2x(:,1),'b', t,d2x(:,2),'-.k'), grid
ylabel('acceleration (m/s^2)')
set(findall(figure(2),'type','line'),'linewidth',2)

%%   Final trajectory in joint space
%   Figure 5.20 of the book
figure(3)
plot(t,q(:,1),'b', t,q(:,2),'-.k'), grid
legend('q_1', 'q_2'), 
xlabel('time (sec)'), ylabel('Joint Angles (degrees)')
set(findall(figure(3),'type','line'),'linewidth',2)

