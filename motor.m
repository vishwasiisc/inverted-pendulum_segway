function torque=motor(t,z,volt)

phi=z(3); omega=z(4);


b=0.01;

T=volt-b*omega



torque=T;

end