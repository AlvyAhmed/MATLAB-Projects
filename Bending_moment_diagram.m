w=20;
l = 4;
x =[0:0.1:4];
v =(-(w*x)+((w*l)/2));
m= -((w*x.^2)/2)+((w*l*x)/2);
plot(x,v)
xlabel('x(m)')
ylabel('Shear force (kN)')
title('Shear force diagam')
figure
plot(x,m)
xlabel('x(m)')
ylabel('Bending moment (kN-m)')
title('Bending Moment Diagram')