f = @(x) sin(1 + 2 ./ cos(x)) - cos(3*x);
a = 1;
b = 100;
N = 10000;

 

x = linspace(a, b, N);
y = f(x);
figure(1);
clf;
plot(x, y, x, zeros(1, N));
hold all
xz=[];
for i = 2 : length(x)
    low = x(i - 1);
    high = x(i);
    try
    x0= fzero(f, [low, high]);
    xz = [xz ; x0];
    plot(x0, f(x0), 'ob');
    catch 
end
end