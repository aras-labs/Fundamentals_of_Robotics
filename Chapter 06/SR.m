%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This program Defines Screw Parameters
%%
function [S] = SR(s_x,s_y,s_z,s_ox,s_oy,s_oz,theta,t)
S=[(s_x ^ 2 - 1) * (0.1e1 - cos(theta)) + 0.1e1 s_x * s_y * ...
    (0.1e1 - cos(theta)) - s_z * sin(theta) s_x * s_z * ...
    (0.1e1 - cos(theta)) + s_y * sin(theta) (t * s_x) - ...
    s_ox * (s_x ^ 2 - 1) * (0.1e1 - cos(theta)) - s_oy * ...
    (s_x * s_y * (0.1e1 - cos(theta)) - s_z * sin(theta)) ...
    - s_oz * (s_x * s_z * (0.1e1 - cos(theta)) + s_y * sin(theta));...
    s_x * s_y * (0.1e1 - cos(theta)) + s_z * sin(theta) ...
    (s_y ^ 2 - 0.1e1) * (0.1e1 - cos(theta)) + 0.1e1 s_y * s_z * ...
    (0.1e1 - cos(theta)) - s_x * sin(theta) t * s_y - s_ox * ...
    (s_x * s_y * (0.1e1 - cos(theta)) + s_z * sin(theta)) -...
    s_oy * (s_y ^ 2 - 0.1e1) * (0.1e1 - cos(theta)) - s_oz * ...
    (s_y * s_z * (0.1e1 - cos(theta)) - s_x * sin(theta));...
    s_x * s_z * (0.1e1 - cos(theta)) - s_y * sin(theta) s_y * ...
    s_z * (0.1e1 - cos(theta)) + s_x * sin(theta) (s_z ^ 2 - 0.1e1)...
    * (0.1e1 - cos(theta)) + 0.1e1 t * s_z - s_ox * ...
    (s_x * s_z * (0.1e1 - cos(theta)) - s_y * sin(theta)) ...
    - s_oy * (s_y * s_z * (0.1e1 - cos(theta)) + s_x * sin(theta))...
    - s_oz * (s_z ^ 2 - 0.1e1) * (0.1e1 - cos(theta)); 0 0 0 1;];
end

