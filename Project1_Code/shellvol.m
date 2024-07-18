function volume = shellvol(a, b, l)
    % initialize function as array of ones of size x (effetively
    % integrating 1 or not having anything behind the integral)
    f = @(x, y, z) ones(size(x));

    % setting bounds of integration based on elliptical cylinder
    y_min = -l / 2;
    y_max = l / 2;
    x_min = -a;
    x_max = a;
    z_min = @(x, y) -b * sqrt(1 - (x / a).^2);
    z_max = @(x, y) b * sqrt(1 - (x / a).^2);

    % integrating for value
    volume = integral3(f, x_min, x_max, y_min, y_max, z_min, z_max);

    % Converting to m^3
    volume = volume / 1e9;
end
