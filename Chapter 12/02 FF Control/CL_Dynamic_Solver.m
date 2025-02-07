%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code Runs the closed loop simulation of 3R manipulator
%   with PD controller with Feed Forward Term
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
