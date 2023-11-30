function u=controls(t,z,p)

Kp1=5;%1.985;%2;%0.8; 
Kd1=1.5;%25;%2.34;%0.2;%0.05;
%Kp2=0.14; Kd2=0.0015;
Kp2=0;%1.2;%0.5;%0.001;%0.004;%0.0008;%0.01; 
Kd2=4.50;%4;%0.00197;%0.003;%0.003;%0.0001%0.004;

%noise=(1e-4)*deg2rad(2*rand-1); %randam noise in measurmentof theta
%rad2deg(noise);


%unpacking state vector
theta=z(1); theta_dot=z(2); x=z(3); x_dot=z(4);

%linear feedback control
torque=1*[Kp1,Kd1,-Kp2,-Kd2]*[theta;theta_dot;x;x_dot];





%motor parameters
u=torque;



%u=sign(v)*(norm(v)-b*norm(omega));


%
umax=0.1*2;

if norm(u)>=umax
    u=sign(u)*umax;
end
%}

%{

    function torque = motor(t,z,volt)

        

        b=0.01;

        T=volt-b*z(4);



        torque=T;



    end
%}



end