%% Poincare map of duffing oscillator
clear all
close all
clc
op = odeset('reltol',1e-12,'abstol',1e-12);
w = (2*pi)/1.4;
tt=0:w:5000;
 
%tt = linspace(0,1000*pi/0.6,501);
 int_con = [0;0];
 count=1;
for i=1:1:50
    [t,x] = ode45(@duffing,tt,int_con,op);
    int_con = (x(end,:))';
    figure(1)
    xlabel("Displacement ")
    ylabel("Velocity ")
    grid on
    
    plot(x(100:end,1),x(100:end,2),'r.');
    hold on
    
     
    count =count+1
end
 

%% Equation of duffing oscillator
function ydot =  duffing(t,y)
    F=0.35;
    w=1.4;
    c=0.1;
    ii =1;
    ydot = [y(2);y(1)-y(1)^3-c*y(2)+F*cos(ii*w*t)];
end