%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This function generates the inverse dynamics of the 3R robot
%   at configuration q
%
function xp = ID_3R(t,x)
% Robot Parameter initilization
run("Parameters.m");
q=x(1:3); dq=x(4:6);

%% Explicit Dynamic
   M=M_Matrix(q);
   G=G_Vector(q);
   C=C_Matrix(q,dq);
   
%% Torue inputs
tau=[0;0;0];
taud=[0;0;0];

%%  Differential Equation in state space form
xp=[dq;
    pinv(M)*(tau+taud-C*dq-G)];

   