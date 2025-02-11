%% 
% 	Fundamentals of Robotics
%   CRC Press, Taylor & Francis Group, LLC
%   © 2025 Hamid D. Taghirad
%
%   This program generates a quintic trajectory 
%   with nonzero initial velocities and accelerations

function [xd,dxd,d2xd]=TP_quintic_via(t,SP)
%
%   Trajectory planning for joints qd 
%
tpoints=SP.xd(:,1);
xpoints=SP.xd(:,2);
ypoints=SP.xd(:,3);
zpoints=SP.xd(:,4);
vx=SP.xd(:,5);vy=SP.xd(:,6);vz=SP.xd(:,7);
ax=SP.xd(:,8);ay=SP.xd(:,9);az=SP.xd(:,10);

for i=1:max(size(tpoints));
    if t>= tpoints(i) && t<=tpoints(i+1)
        t0=tpoints(i);tf=tpoints(i+1);
        x0=xpoints(i);xf=xpoints(i+1);
        y0=ypoints(i);yf=ypoints(i+1);
        z0=zpoints(i);zf=zpoints(i+1);
        vx0=vx(i);vxf=vx(i+1);
        vy0=vy(i);vyf=vy(i+1);
        vz0=vz(i);vzf=vz(i+1);
        ax0=ax(i);axf=ax(i+1);
        ay0=ay(i);ayf=ay(i+1);
        az0=az(i);azf=az(i+1);
        break
    end
end
if t0==0,
a=[x0   y0  z0; 
   vx0  vy0  vz0;
   ax0/2 ay0/2 az0/2;
    10/tf^3*(xf-x0)-2/tf^2*(2*vxf+3*vx0)+1/2/tf*(3*axf-ax0)...
    10/tf^3*(yf-y0)-2/tf^2*(2*vyf+3*vy0)+1/2/tf*(3*ayf-ay0)...
    10/tf^3*(zf-z0)-2/tf^2*(2*vzf+3*vz0)+1/2/tf*(3*azf-az0);
    -15/tf^4*(xf-x0)+1/tf^3*(7*vxf+8*vx0)-1/2/tf^2*(3*axf-2*ax0)...
    -15/tf^4*(yf-y0)+1/tf^3*(7*vyf+8*vy0)-1/2/tf^2*(3*ayf-2*ay0)...
    -15/tf^4*(zf-z0)+1/tf^3*(7*vzf+8*vz0)-1/2/tf^2*(3*azf-2*az0);
    6/tf^5*(xf-x0)-3/tf^4*(vxf+vx0)+1/2/tf^3*(axf-ax0)...
    6/tf^5*(yf-y0)-3/tf^4*(vyf+vy0)+1/2/tf^3*(ayf-ay0)...
    6/tf^5*(zf-z0)-3/tf^4*(vzf+vz0)+1/2/tf^3*(azf-az0)];
else
A=[ 1   t0  t0^2    t0^3    t0^4    t0^5
    1   tf  tf^2    tf^3    tf^4    tf^5
    0   1   2*t0    3*t0^2  4*t0^3  5*t0^4
    0   1   2*tf    3*tf^2  4*tf^3  5*tf^4
    0   0   2       6*t0    12*t0^2 20*t0^3    
    0   0   2       6*tf    12*tf^2 20*tf^3];
%
%   Zero initial velocity and acceleration
%
y=[ x0 y0 z0;
    xf yf zf;
    vx0 vy0 vz0;
    vxf vyf vzf;
    ax0 ay0 az0;
    axf ayf azf];
a=A\y;
end

tx=     [1  t       t^2     t^3     t^4     t^5];
tdx=    [0  1       2*t     3*t^2   4*t^3   5*t^4];
td2x=   [0  0       2       6*t     12*t^2  20*t^3];

xd=    (tx*a)';
dxd=   (tdx*a)';
d2xd=  (td2x*a)';


