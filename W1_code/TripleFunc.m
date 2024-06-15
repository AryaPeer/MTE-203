function eq = TripleFunc_Peer(x)
    f=x(1)*(x(2))^2-5*x(3)+exp(x(3))-6;
    g=x(1)-3*exp(x(2)*x(3))+5;
    h=8*x(3)-(x(2))^3-6*exp(x(1)*x(2))-10;
    eq = [f,g,h];
end

