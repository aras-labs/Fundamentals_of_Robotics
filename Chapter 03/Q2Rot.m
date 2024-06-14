%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides the represention of rotation 
%   from quaternion to Rotation matrix
%
%% Parameter Definitions
clear all; clc; 
deg2rad=pi/180;rad2deg=1/deg2rad;
theta=90; %in degrees
s=[1; -1; 0];   %not normalized
s=s/norm(s);
theta=theta*pi/180;
e=[s(1)*sin(theta);
    s(2)*sin(theta);
     s(3)*sin(theta);
      cos(theta)]
a=1; alpha=30*deg2rad;
d=0.1; theta=60*deg2rad;

T1=DH(a,alpha,d,theta)

a=0.5; alpha=-60*deg2rad;
d=0.2; theta=-30*deg2rad;

T2=DH(a,alpha,d,theta)

T3=T1*T2

a=0.2; alpha=-30*deg2rad;
d=1; theta=90*deg2rad;
T4=DH(a,alpha,d,theta)

T5=T2*T4
T6=T3*T4
