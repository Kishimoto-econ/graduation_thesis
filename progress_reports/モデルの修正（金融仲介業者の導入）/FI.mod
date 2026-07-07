var
    q k R b x varphi mu
    kp
    kai nu eta zeta N phi Ne Nn
    xp bp Y
    ;

varexo eb;

parameters
    betap c a beta
    alpha z
    betaFI theta rho omega m K_bar
    ;

    betap = 0.985;
    c = 0.3;
    a = 0.7;
    beta = 0.99;
    alpha = 1/3;
    z = 0.01;
    betaFI = 0.98;
    theta = 0.95;
    rho = 0.4;
    omega = 0.002;
    m = 0.5;
    K_bar = 1;

model;
    q * (k - k(-1)) + R * b(-1) + x - c * k(-1) = a * k(-1) + b;
    R * b = q(+1) * k;
    x = c * k(-1);
    1 + varphi = (beta * (1 + varphi(+1)) + mu) * R;
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * (a + c + q(+1)) + mu * q(+1);
    q = betap * (alpha * (z + kp)^(alpha - 1) + q(+1));
    nu = (1 - theta) * betaFI * (R(+1) - 1/betap) + betaFI * theta * kai(+1) * nu(+1);
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);
    phi = eta / (rho - nu);
    b = phi * N * (1 - eb);
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;
    kai = phi / phi(-1) * zeta;
    N = Ne + Nn;
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1);
    Nn = omega * b(-1);
    x + m * xp + b(-1) / betap + bp(-1) / betap = Y + m * (1 - theta - omega) * b(-1);
    Y = (a + c) * k(-1) + m * (z + kp)^alpha;
    k + m * kp = K_bar;
    b + m * bp = 0;
end;

initval;
     q =  33.262110;
     k =   0.738080;
     R =   1.021497;
     b =  24.033447;
     x =   0.221424;
    varphi =  41.428571;
    mu =  -0.468622;
    kp =   0.523840;
    kai =   1.043228;
    nu =   0.010683;
    eta =   1.738872;
    zeta =   1.043228;
     N =   5.380863;
    phi =   4.466467;
    Ne =   5.332796;
    Nn =   0.048067;
    xp =  51.797011;
    bp = -48.066894;
     Y =   1.143689;
end;

shocks;
    var eb = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=12,ar=0,TeX)
q k R b x varphi mu kp kai nu eta zeta N phi Ne Nn xp bp Y;
