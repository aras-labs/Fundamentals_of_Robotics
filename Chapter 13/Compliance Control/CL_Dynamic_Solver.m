%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This program simulates compliance control of the 3R planar robot
%   while interacting with environment in task space
%
%% Initializing
clear ;
clc ; clf ; cla;
tic

% Determining the Structure 
[SP] = Structural_Parameters() ;

% find joint space initial conditions
ys=[SP.x0 ; SP.qd0; SP.qd0]; 
Qs=IK(ys, SP); q0=Qs(1:3);

% Solve The Dynamic Equation

[t,q] = ode23s(@(t,qs) CL_Dynamics(t,qs,SP), SP.tspan, ...
    [q0 ; SP.qd0; SP.qi0; SP.xi0] ... % initial condition for intergrations
    ,odeset('OutputFcn','odeplot','OutputSel',[1:3])) ;
toc

% Ploting and Exporting the Results
[Out]=PlotData(t,q,SP);
