function sol = myEuler(rhsDynamics,Z0,tspan,p,delay)

tarray=tspan';
n=length(tspan);  %number of timestapes
neq=length(Z0);

zarray=zeros(n,neq);   %array to store solution states are stored in columns
zarray(1,:)=Z0';   %first row of the array is initial condition






%inatilizing integration
z=Z0;
dt=tspan(2)-tspan(1);
t=tspan(1);

for i = 2:n

    zdot=rhsDynamics(t,z,p,delay);

    %euler method integrator
    z=z+zdot*dt;

    t=tspan(i);
    dt=tspan(i)-tspan(i-1);


    zarray(i,:)=z;
    
end


sol.t=tarray;
sol.z=zarray;

end