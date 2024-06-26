%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This function generates the closed-loop dynamic formulation
%   of the 3R planar robot with PD controller
%
function [cost] = CL_Dynamics(t,qs,SP)

q   = qs(1:3) ;
qd  = qs(4:6) ;

[Dynamic_Mats] = Dynamic_Matrices(qs, SP) ;
[Dynamic_Tau] = PD_Control(t,qs,SP) ;

cost = [qd ; 
        pinv(Dynamic_Mats.M)*(Dynamic_Tau.tau ...
                        -Dynamic_Mats.C*qd-Dynamic_Mats.G)] ;

end
