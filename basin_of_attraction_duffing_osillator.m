%% basin of attraction for forced dufffing oscillator
clear all 
clc


%% Initial condition space
x = linspace(-2.5,2.5,500);
y = linspace(-2.5,2.5,500);

%% Fixed points
f1u = 1.28046;
f1d=0.864627;
f2u =-0.684627;  
f2d=-1.28075;

%% storing in matrix
ysol1 = [];
ysol2 = [];
 
 count=1;

for i=1:length(x)
  for j=1:length(y)
         x0 = [x(i);y(j)];
         t = 0:0.1:1000;
         [tsol,ysol] = ode45(@d,t,x0);
        temp = ysol([7991:end],1);
        maximum = max(temp);
        minimum = min(temp);
        if (maximum-f1u)<=0 && (minimum-f1d)<=0
          ysol1 = [x0 ysol1];
        
        else
            ysol2=[x0 ysol2];
        end
        count=count+1     
   end
end
 figure
set(gcf,'color','w') 
hold on
plot(ysol1(1,:),ysol1(2,:),'.','color','r') ;
plot(ysol2(1,:),ysol2(2,:),'.','color','b') ;
 

 
%% Equations of duffing oscillator
function ysol = d(t,x)
    del = 0.25;
    F=0.25;
    w=1;
    
    ysol = [x(2);x(1)-(x(1)^3)-(del*x(2))+(F*cos(w*t))];
end
