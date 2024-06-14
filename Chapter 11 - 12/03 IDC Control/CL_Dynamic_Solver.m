%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code Runs the closed loop simulation of 3R manipulator
%   with Inverse Dynamic + PID controller
%   
%% Initializing
clear ;
clc ; clf ; cla;
tic

%% Determining the Structure 

[SP] = Structural_Parameters() ;

%% Solve The Dynamic Equation

[t,q] = ode23s(@(t,qs) CL_Dynamics(t,qs,SP), SP.tspan, ...
    [SP.q0 ; SP.qd0; SP.qi0; SP.xi0] ... % initial condition for intergrations
    ,odeset('OutputFcn','odeplot','OutputSel',[1:3])) ;
toc
%% Ploting and Exporting the Results
[Out]=PlotData(t,q,SP);
