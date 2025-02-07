%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This code provides a better representation of 
%   the symbolic matrices in MATLAB
%%
function [T_real] = Matrix_Vpa(T3,n,m)

for i=1:n
    for j=1:m
        [C,T] = coeffs(T3(i,j));
        c=vpa(C,2);
        if abs(c) < 0.001
            c=0;
        end
            T3_real(i,j)=dot(c,T);

    end
end
T_real=vpa(T3_real,3);
end

