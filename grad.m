function y = grad(x)
    y = (cos(x) - (sin(x)./x))./x + 2.*x;
end