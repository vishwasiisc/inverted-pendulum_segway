function zdot=rhsDynamics_segway(t,z,p,delay)

%unpacking paramaters
g=p.g; Ip=p.Ip; m=p.m; l=p.l; r=p.r; Iw=p.Iw; M=p.M;
L=l/2;

%unpacaking state vector
theta=z(1); theta_dot=z(2);x=z(3); x_dot=z(4);





%u=0;
u=controls(t,z,p);

x_ddot=-u/((m+M)*r);

%alpha=((m+M)*r*r*phiddot+(m+M)*r*l*cos(theta)*phiddot+m*g*l*sin(theta))/(I1);%-u/(I1+I2);

alpha=(m*g*l*sin(theta)+(m+M)*(l*cos(theta)+r)*x_ddot)/(Ip+m*((r+L)^2)+Iw+M*r*r);
%omega_dot=phiddot;


zdot=[theta_dot,alpha,x_dot,x_ddot]';

end