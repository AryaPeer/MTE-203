function volume = capvol(a, b, w, d)    
    syms x y z
    
    %Setting caps lower and upper bound
    cap_lower_bound = @(z, y) a * sqrt(1 - z^2 / b^2);
    cap_upper_bound = a;
    
    % triple integral integrating x, z, and then y boundaries
    volume = int(int(int(1, x, cap_lower_bound(z, y), cap_upper_bound), z, -d/2, d/2), y, -w/2, w/2);
    
    % converting to m^3
    volume = double(volume) / 1e9;
end
