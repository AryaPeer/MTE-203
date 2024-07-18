function volume_tube = tubevol(a, w, d)
    % initialize function as array of ones of size x (effetively
    % integrating 1 or not having anything behind the integral)
    f = @(x, y, z) ones(size(x));

    % Third integral between bounds calculated for a rectangular tube
    volume_tube = integral3(f, -a, a, -w/2, w/2, -d/2, d/2);

    % Convert to m^3
    volume_tube = volume_tube / 1e9;
end
