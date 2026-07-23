var
    q
    k
    R
    b
    x
    varphi  $\varphi$
    mu  $\mu$
    
    kp  $k^\prime$
    
    kai $\chi$
    nu  $\nu$
    eta $\eta$
    zeta    $\zeta$
    N
    phi $\phi$
    Ne  $N_e$
    Nn  $N_n$
    
    xp  $x^\prime$
    bp  $b^\prime$
    Y
    epsb  $\epsilon_b$
    ;

varexo 
    eN  $\epsilon_N$
;

parameters
    betap c a beta
    alpha z
    betaFI theta rho omega m K_bar
    delta
    epsb_star gamma_q q_star gamma_N N_star gamma_b b_star
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
    delta = 0.9;
    epsb_star = 0;
    gamma_q = 0.1;
    q_star = 33;
    gamma_N = 0.5;
    N_star = 5.3;
    gamma_b = 0.1;
    b_star = 24;

model;
    q * (k - k(-1)) + R(-1) * b(-1) + x - c * k(-1) = a * k(-1) + b;
    R * b = q(+1) * k;
    x = c * k(-1);
    (1 + varphi) = (beta * (1 + varphi(+1)) + mu) * R;
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * (a + c + q(+1)) + mu * q(+1);
    q = betap * (alpha * (z + kp)^(alpha - 1) + q(+1));
    nu = (1 - theta) * betaFI * (R(+1) - 1/betap) + betaFI * theta * kai(+1) * nu(+1);
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);
    phi = eta / (rho - nu);
    b = phi * N * (1+epsb);
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;
    kai = phi / phi(-1) * zeta;
    N = Ne + Nn;
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1) * (1-eN);
    Nn = omega * b(-1);
    x + m * xp + R(-1) * b(-1) + m * bp(-1) / betap = Y + m * (1 - theta - omega) * b(-1);
    Y = (a + c) * k(-1) + m * (z + kp(-1))^alpha;
    k + m * kp = K_bar;
    b + m * bp = N;
    epsb = epsb_star + gamma_q * (q(-1) - q_star) + gamma_N * (N(-1) - N_star) + gamma_b * (b(-1) - b_star);
end;

//initval;
    
//end;

shocks;
    var eN = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=10,ar=0,TeX)
q k R b x varphi mu kp kai nu eta zeta N phi Ne Nn xp bp Y epsb;

optim_weights;
    q 1;
    Y 1;
end;

osr_params
    gamma_q
    gamma_N
    gamma_b
    ;
osr;