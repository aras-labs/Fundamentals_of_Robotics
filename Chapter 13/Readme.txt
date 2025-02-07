
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
The following folders corresponds to different controllers simulated 
on 3R robot and reported in Chapter 13 of the book: 

Folders:
Compliance Control  closed loop simulation of compliance control on 3R robot
Force Control       closed loop simulation of direct force ontrol on 3R robot

Programs in the folders:
1- CL_Dynamic_Solver    The main simulation code
2- CL_Dynamics          The main function called in the main program
3- Dynamic_Matrices     The Dynamic vector and matrices function of 3R robot
4- XXXX_Control         The controller function used in the closed loop simulation
5- PlotData             The function of plotting the results
6- Collision            The function to detect collision and estimate interaction wrench
7- IK                   The function to calculate inverse kinematics
                        and velocity and accelerations
8- Kinematics           The function to calculate forward kinematics 
                        and Jacobian matrices
9- TP_quintic           Trajectory Planner based on quintic polynomials
10- Structural_Parameters
                        All the simulation parameters are set in this 
                        function in a structural format

To run a new simulation, just change the simulation parameters in 
Structural_Parameters function and run CL_Dynamic_Solver on the right folder