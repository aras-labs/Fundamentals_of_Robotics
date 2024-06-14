%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This program simulates Force control of the 3R planar robot
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
    [q0 ; SP.qd0; SP.taui0; SP.taudi0] ... % initial condition for intergrations
    ,odeset('OutputFcn','odeplot','OutputSel',[1:3])) ;
toc

% Ploting and Exporting the Results
[Out]=PlotData(t,q,SP);