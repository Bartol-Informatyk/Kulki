a = -5;
b = +5;
N = 50;

 

xs = linspace(a ,b, N);
ys = linspace(a, b, N);

 

[x, y] = meshgrid(xs, ys);

 

z = 10 -sqrt(x.^2 + y.^2);
clear all
clc
clf
phi_v = linspace(0, 360, 72);
r_v = linspace(0, 1, 50);

 

[phi, r] = meshgrid(phi_v, r_v);

 

x = r .* cosd(phi);
y = r .* sind(phi);
z1 = 1 - r;
z1 (x>0 & y>0) = NaN;
figure(1);
clf;
surfc(x, y, z1);
xlabel 'x';
ylabel 'y';
zlabel 'z';
hold all;

 

z2 = (1-r)/4;
z2(x>0 & y>0) = NaN;
surfc(x, y, z2);
colormap flag
z3 = (1 - r);
contour(x, y, z3);
view(170.5, 39.5);

 

loops = 100
M(loops) = struct('cdata', [], 'colormap', []);
h.Visible = 'off';
for j = 1:loops
    view(80+ 5*j, 30.5);
    axis equal
    drawnow
    M(j) = getframe;
end
h.Visible = 'on';
pause
movie(M);