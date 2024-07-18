clc
clear

% case 1 vals 
a = 400; 
b = 200;
l = 3000;

% call shell function and output final val
volume_shell = shellvol(a, b, l);
disp(['The volume of shell for case 1 is: ', num2str(volume_shell), ' cubic meters']);

clearvars -except volume_shell

% case 2 vals 
a = 600;
b = 400;
l = 2400;

% call shell function and output final val
volume_shell2 = shellvol(a,b,l);
disp(['The volume of shell for case 2 is: ', num2str(volume_shell2), ' cubic meters']);

clearvars -except volume_shell volume_shell2

% case 1 vals 
a = 400; 
w = 100;
d = 50;

% call tube function and output final volume
volume_tube = tubevol(a, w, d);
disp(['The volume of the tubes for case 1 are: ', num2str(volume_tube), ' cubic meters']);

clearvars -except volume_shell volume_shell2 volume_tube

% case 2 vals 
a = 600; 
w = 150;
d = 75;

% call tube function and output final volume
volume_tube2 = tubevol(a, w, d);
disp(['The volume of the tubes for case 2 are: ', num2str(volume_tube2), ' cubic meters']);

clearvars -except volume_shell volume_shell2 volume_tube volume_tube2

% case 1 vals 
a=400;
b=200;
w=100;
d=50;

% call cap function and output final val
volume_cap = capvol(a, b, w, d);
disp(['The volume of the caps for case 1 are ', num2str(volume_cap), ' cubic meters']);

clearvars -except volume_shell volume_shell2 volume_tube volume_tube2 volume_cap

% case 2 vals 
a=600;
b=400;
w=150;
d=75;

% call cap function and output final val
volume_cap2 = capvol(a, b, w, d);
disp(['The volume of the caps for case 2 are ', num2str(volume_cap2), ' cubic meters']);

clearvars -except volume_shell volume_shell2 volume_tube volume_tube2 volume_cap volume_cap2

volume_total = volume_shell - 6 * volume_tube + 12 * volume_cap;
volume_total2 = volume_shell2 - 6 * volume_tube2 + 12 * volume_cap2;

disp(['The total volume for case 1 is ', num2str(volume_total), ' cubic meters']);
disp(['The total volume for case 2 is ', num2str(volume_total2), ' cubic meters']);