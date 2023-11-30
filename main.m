%main segway 3

clear;
close all;
clc;

m=0.7 ; l=0.15;  g=10; Ip=m*l*l/12;   %m0.3 l0.15

%wheel parameters
 M=0.1;%0.1;  %100 gm
 r=0.05;  %5 cm

 Iw=M*r*r/2;%M*r*r;%M*r*r*10;

%packing parameters

p.Ip=Ip; p.g=g; p.l=l; p.m=m; %p.Icg=Icg;
p.r=r; p.M=M; p.Iw=Iw;

%initial condition
theta=deg2rad(20);
theta_dot=deg2rad(0);
alpha=0;
x=0; 
x_dot=0;

%state vector
z0=[theta,theta_dot,x,x_dot]';

%backlash delay
delay=0.44;%0.55; %0.4


%%
%time
tend=15;
tspan=linspace(0,tend,12000);

%{
sol=myEuler(@rhsDynamics_segway,z0,tspan,p,delay);
t=sol.t;
z_array=sol.z;
%}

%


%%LQR

m=p.m;

A=[0,1,0,0;
    m*g*l/(Ip+Iw),0,0,0;
    0,0,0,1;
    0,0,0,0];

B=0;


%%dynamics solution

small=1e-13;
options=odeset('RelTol',small,'AbsTol',small);

sol=ode45(@(t,z)rhsDynamics_segway(t,z,p,delay),tspan,z0,options);

t=sol.x';
z_array=sol.y';
%}


theta_array=z_array(:,1);
theta_dot_array=z_array(:,2);
x_array=z_array(:,3);
x_dot_array=z_array(:,4);


%%
%plot(t,theta_array);
figure(1)
subplot(2,1,1)
plot(t,rad2deg(theta_array),LineWidth=1.5)
title("lean angle")
movegui('southwest')

figure(1)
subplot(2,1,2)
plot(t,rad2deg(theta_dot_array),LineWidth=1.5)
title("lena angle speed")
%movegui('northeast')

figure(2)
subplot(2,1,1)
plot(t,x_array,LineWidth=1.5);
title("x")
movegui("southeast")

figure(2)
subplot(2,1,2)
plot(t,x_dot_array,LineWidth=1.5);
title("x_dot")
%movegui("southeast")

%animate(theta_array,x_array,t,12)
animate1(sol,tend,0.5)


