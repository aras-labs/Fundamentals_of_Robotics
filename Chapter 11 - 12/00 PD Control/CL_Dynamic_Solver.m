%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code Runs the closed loop simulation of 3R manipulator
%   with PD controller
%   
%% Parameter Definitions
clear ;
clc ; clf ; cla;

%% Determining the Structure 

[SP] = Structural_Parameters() ;

%% Solve The Dynamic Equation

[t,q] = ode23s(@(t,qs) CL_Dynamics(t,qs,SP), SP.tspan, ...
    [SP.q0 ; SP.qd0],odeset('OutputFcn','odeplot','OutputSel',[1:3])) ;

%% Ploting and Exporting the Results
[Out]=PlotData(t,q,SP);
