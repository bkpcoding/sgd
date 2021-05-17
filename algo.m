M = 5;
a = 0.001;
b = 0.1;
ee = -1 + 2.*rand(1,M);
xn = zeros(1,1000);
xn(1) = 20;
count = 0;
for n = 1 : 1000
    sum = 0;
    for i = 1 : M
        sum = sum + noncon(xn(n) + b*ee(i));
    end
    sum = double(sum) / M;
    if noncon(xn(n)) <= sum
        xn(n+1) = xn(n) - a*grad(xn(n));
    else
        min = 1e+09;
        mini = 0;
        for i = 1 : M
            y = noncon(xn(n) + b*ee(i));
            if y < min
                min = y;
                mini = i;
            end
        end
        count = count+1;
        xn(n) = xn(n) + b*ee(mini);
        n = n - 1;
    end
end
x = -50:0.1:50;
plot(x,xn);