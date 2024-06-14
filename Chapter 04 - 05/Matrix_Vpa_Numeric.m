%% 
% 	Fundamentals of Robotics: Practical Case Studies with Matlab & Python
%   By Prof. Hamid D. Taghirad
%   Copyright CRC - Press @2025
%
%   This code provides a better representation of 
%   symbolic matrices, which are numerically sustituted.
%%
function [T_real] = Matrix_Vpa_Numeric(T3,n,m)

for i=1:n
    for j=1:m
        C = T3(i,j);
        c=vpa(C,2);
        if abs(c) < 0.001
            c=0;
        end
            T3_real(i,j)=c;

    end
end


T_real=vpa(T3_real,3);
end

