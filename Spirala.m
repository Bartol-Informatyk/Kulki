param = odeset('MaxStep' , 0.001);
[t, x] = ode45(@fun, [0,100],[0.3,0], param);
L = x(:,1);
v= x(:,2);
plotyy(t, L, t,v);
legend ('L' , 'v');

plot (L,v);
xlabel('L');
ylabel('v');

function dxdt = fun(t, x)
L =x(1);
v =x(2);

m =0.1; % kg
k=0.5;
L0 =0.05; %metry
g=9.81; %m/s^2
if L>=L0
    F= m*g - k .* (L-L0);
else
    F=-m*g;
end
F = F - 0.01* v;
dxdt = zeros(2,1);
dxdt(1)= v;
dxdt(2)= F/m;
end