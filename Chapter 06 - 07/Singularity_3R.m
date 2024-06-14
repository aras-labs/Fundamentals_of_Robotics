%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides Optimal solution of redundancy problem 
%   with Singularity Circumvention objective in 3R robot
%
%% Parameter Definitions
clear all
global Par
% optimization options
options = optimoptions(@fmincon,'Display','off'); % Turn off Display

% initial conditions and parameter settings
Par.q0=pi/180*[-180;-179;10];
Par.qdot0=[0;0;0];
Par.a=[1;1;0.3];        %a1, a2, a3
Par.t=[0.01;1];         % dt, t_final
Par.qd=pi/180*[60;-80;-10]; %desired pose for obstacle avoidance
Par.qmin=pi/180*[-190;-190;-30]; Par.qdotmin=-Inf*[1;1;1];  % joint variable lower bound
Par.qmax=pi/180*[-170;-170;30]; Par.qdotmax=+Inf*[1;1;1];  % joint variable upper bound
Par.selection = 'ka';  % selection of optimization cost function
                         % use 'mu' for manipulability measure
                         % use 'ka' for manipulability measure
                         % use 'ba' for base solution

% Problem initialization
q0=Par.q0;qdot0=Par.qdot0;
th1=q0(1);th2=q0(2);th3=q0(3);
th12=th1+th2;th123=th12+th3;
s1=sin(th1);c1=cos(th1);
s12=sin(th12);c12=cos(th12);
s123=sin(th123);c123=cos(th123);
a1=Par.a(1);a2=Par.a(2);a3=Par.a(3);

% Forward Kinematics for the first point
x0=a1*c1+a2*c12+a3*c123;
y0=a1*s1+a2*s12+a3*s123;
%
%% Trajectory Generatation
%
dt=Par.t(1); tfinal=Par.t(2);
t=0:dt:tfinal; t=t';
n=max(size(t));dt=t(2)-t(1);

%
%    Path generation
%
x=x0+0*t; y=y0-(3-2*t).*t.^2*(y0+0);
xdot=0*t; ydot=(y0+0)*(6*t.^2-6*t);
z(:,1)=[q0;qdot0];

%
%%   Optimization scheme
%
for i=1:n
    chi=[x(i);y(i)];chidot=[xdot(i);ydot(i)];
    Par.chi=chi; Par.chidot=chidot;  % to pass to the constraint function
    th1=z(1,i);th2=z(2,i);th3=z(3,i);
    th12=th1+th2;th123=th12+th3;
    s1=sin(th1);c1=cos(th1);
    s12=sin(th12);c12=cos(th12);
    s123=sin(th123);c123=cos(th123);
    J=[-a1*s1-a2*s12-a3*s123    -a2*s12-a3*s123  -a3*s123
            a1*c1+a2*c12+a3*c123     a2*c12+a3*c123   a3*c123];
     Lb=[Par.qmin;Par.qdotmin];
     Ub=[Par.qmax;Par.qdotmax];
        nonlcon=@kinematics;
        [sol(:,i),fval(i),eflag(i),output(:,i)]= ...
          fmincon(@sing_avoid, z(:,i),[],[],[],[],Lb,Ub, nonlcon,options);
        z(:,i+1)=sol(:,i);
end 
%
%% Output generation
%
z=z(:,1:n); % eliminate the last iteration from output

th1=z(1,:);th2=z(2,:);th3=z(3,:);
th12=th1+th2;th123=th12+th3;
s1=sin(th1);c1=cos(th1);
s12=sin(th12);c12=cos(th12);
s123=sin(th123);c123=cos(th123);

% Forward Kinematics for the solution
px0=0*c1; py0=0*s1;
px1=a1*c1; py1=a1*s1;
px2=a1*c1+a2*c12; py2=a1*s1+a2*s12;
px3=a1*c1+a2*c12+a3*c123; py3=a1*s1+a2*s12+a3*s123;
px0=px0';px1=px1';px2=px2';px3=px3';
py0=py0';py1=py1';py2=py2';py3=py3';

xrobot=[px0 px1 px2 px3]; yrobot=[py0 py1 py2 py3];

%
%%   Robot position plot
%
figure(1),
plot(xrobot(1,:),yrobot(1,:),'-o',...
        xrobot(0.2*(i-1),:),yrobot(0.2*(i-1),:),'-.o',...
        xrobot(0.4*(i-1),:),yrobot(0.4*(i-1),:),'--o',...
        xrobot(0.6*(i-1),:),yrobot(0.6*(i-1),:),':o',...
        xrobot(0.8*(i-1),:),yrobot(0.8*(i-1),:),'-o',...
            xrobot(i,:),yrobot(i,:),'-.o',...
            px3,py3,'-.'),grid
  set(findall(figure(1),'type','line'),'linewidth',2)
  
  %%   Optimization Cost function
 
    function V=sing_avoid(z)
    global Par
    q=z(1:3); qdot=z(4:6);
    %V=norm(q-Par.qd,2);
    %V=norm(z,2);
    a1=Par.a(1);a2=Par.a(2);a3=Par.a(3);
    th1=z(1);th2=z(2);th3=z(3);
    th12=th1+th2;th123=th12+th3;
    s1=sin(th1);c1=cos(th1);
    s12=sin(th12);c12=cos(th12);
    s123=sin(th123);c123=cos(th123);
%     J=[-a1*s1-a2*s12-a3*s123    -a2*s12-a3*s123  -a3*s123
%          a1*c1+a2*c12+a3*c123     a2*c12+a3*c123   a3*c123];
    J=[-a1*s1-a2*s12    -a2*s12
         a1*c1+a2*c12     a2*c12];
    if Par.selection == 'mu';
        V=-det(J*J')^0.5;   % Manipulability measure
    elseif Par.selection == 'ka';
        V=-rcond(J);        % Dexterity measure
    else
        V=norm(z,2)^2;
    end 
    end     % end of nested function
    
    %%   Optimization Constraint function

    function [c,ceq]=kinematics(z)
    global Par
    a1=Par.a(1);a2=Par.a(2);a3=Par.a(3);
    th1=z(1);th2=z(2);th3=z(3);
    th12=th1+th2;th123=th12+th3;
    s1=sin(th1);c1=cos(th1);
    s12=sin(th12);c12=cos(th12);
    s123=sin(th123);c123=cos(th123);
    J=[-a1*s1-a2*s12-a3*s123    -a2*s12-a3*s123  -a3*s123
            a1*c1+a2*c12+a3*c123     a2*c12+a3*c123   a3*c123];
    x=[a1*c1+a2*c12+a3*c123;  a1*s1+a2*s12+a3*s123]; % kinematics
    % kinematics and Jacobian constraits
        ceq=[Par.chi-x;Par.chidot-J*z(4:6)];  
    % No inequality constraint
        c=[];
    end     % end of nested function
    
