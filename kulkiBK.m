global N k m freq
N = 7; 
k = 1000; 
m = 0.010; 

freq = 45; 
t_end = 1;

start = zeros(2*N, 1); 

figure(1);
clf;
subplot(2,1,1);
ode45(@odefun, [0 t_end], start)
title ('N kulek na sprężynkach');
xlabel ('czas w [s]');
ylabel ('prędkość w [m/s]');
legend ('Kulka1', 'Kulka2', 'Kulka3', 'Kulka4','Kulka5', 'Kulka6', 'Kulka7');
subplot(2,1,2);
t = linspace(0, t_end, 1000);
plot(t, Fexternal(t));
xlabel ('czas w [s]');
ylabel ('wychylenie w [cm]');
legend ('wychylenie');

function dqdt = odefun(t, q)
    global N k m
    
    x = q(1:N);         
    v = q((N+1):(2*N)); 
    
    dxdt = zeros(N, 1);    
    dvdt = zeros(N, 1);
    
    for i = 1: N
        dxdt(i) = v(i);
        dvdt(i) = force(i, x, t) ./ m;
    end
    
    dqdt = zeros(size(q));
    dqdt(1:N) = dxdt;
    dqdt((N+1):(2*N)) = dvdt;
end

function F = Fexternal(t)
    global freq
    A = 1.0;
    phi = 0;
    F = A .* sin(2 * pi * freq .* t + phi);
end

function F = force(i, x, t)    
    global N k m   
    if i == 1
        F = k * (x(i+1) - 2*x(i));
    elseif i == N
        F = -k * (x(N) - x(N-1));
    else
        F = k * (x(i+1) - 2*x(i) + x(i-1)) + Fexternal(t);
    end
end
