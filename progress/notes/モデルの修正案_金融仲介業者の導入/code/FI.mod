var
    q
    k
    R
    b
    x
    varphi  $\varphi$
    mu      $\mu$
    
    kp      $k^\prime$
    
    chi     $\chi$
    nu      $\nu$
    eta     $\eta$
    zeta    $\zeta$
    N
    phi     $\phi$
    Ne      $N_e$
    Nn      $N_n$
    
    xp      $x^\prime$
    bp      $b^\prime$
    Y
    eb      $\epsilon^b$
;

varexo 
    eN      $\epsilon_N$
;

parameters 
    beta        // Discount factor of Farmer
    betap       // Discount factor of Gatherer
    betaFI      // Discount factor of FI
    alpha       // Capital share for Gatherer
    a           // Return on capital for Farmer
    c           // Non-tradable Return on capital for Farmer
    z           // Fixed factor in Gatherer's production
    theta       // Survival probability of bankers
    omega       // Transfer rate to new bankers
    rho         // Parameter in FI's leverage equation
    m           // Relative size of Gatherer to Farmer
    Kbar        // Total real estate
    eb_star     // Policy in steady state
    A
    B
    C


    // Policy Parameters
    gamma_q     // Policy reaction to real estate price
    gamma_N     // Policy reaction to net worth of FI
    gamma_b     // Policy reaction to total borrowing of farmer

    // Steady State Values
    q_ss
    k_ss
    R_ss
    b_ss
    x_ss
    varphi_ss
    mu_ss
    kp_ss
    xp_ss
    bp_ss
    nu_ss
    chi_ss
    eta_ss
    zeta_ss
    phi_ss
    N_ss
    Ne_ss
    Nn_ss
    Y_ss
    epsilon_b_ss
;

    // values
    beta    = 0.99;
    betap   = 0.985;
    betaFI  = 0.98;
    alpha   = 1/3;
    a       = 0.7;
    c       = 0.3;
    z       = 0.01;
    theta   = 0.95;
    omega   = 0.002;
    rho     = 0.4;
    m       = 0.5;
    gamma_q = 0;
    gamma_N = 0;
    gamma_b = 0;
    Kbar    = 1;
    A       = rho*betaFI*theta^2;
    B       = - rho*theta*(1+betaFI) - omega*(1-theta)*betaFI;
    C       = rho - omega*(1-theta)*(1-betaFI/betap);

    // Stady state
    zeta_ss         = (-B - (B^2 - 4*A*C)^(1/2)) / 2*A;
    phi_ss          = (1-theta*zeta_ss) / omega;
    eta_ss          = (1-theta)/(1-betaFI*theta*zeta_ss);
    chi_ss          = zeta_ss;
    nu_ss           = eta_ss * betaFI * (zeta_ss-1/betap)/phi_ss;
    R_ss            = (zeta_ss-1/beta)/phi_ss + 1/betap;
    q_ss            = a*R_ss / (R_ss-1);
    kp_ss           = (q_ss*(1-betap)/(alpha*betap))^(1/(alpha-1)) - z;
    k_ss            = Kbar - m*kp_ss;
    b_ss            = q_ss*k_ss/R_ss;
    N_ss            = b_ss/phi_ss;
    Nn_ss           = omega*b_ss;
    Ne_ss           = N_ss - Nn_ss;
    x_ss            = c*k_ss;
    Y_ss            = (a+c)*k_ss + m*(z+kp_ss)^alpha;
    xp_ss           = (Y_ss + m*(1-theta-omega)*b_ss - x_ss - R_ss*b_ss-m/betap*b_ss)/m;
    varphi_ss       = (beta*(a+c)-a) / (a*(1-beta));
    mu_ss           = (1+varphi_ss)*(1/R_ss - beta);
    bp_ss           = b_ss/m*((1-phi_ss)/phi_ss);
    epsilon_b_ss    = 0;

model;
    q * (k - k(-1)) + R(-1) * b(-1) + x - c * k(-1) = a * k(-1) + b;
    R * b = q(+1) * k;
    x = c * k(-1);
    1 + varphi = (beta * (1 + varphi(+1)) + mu) * R;
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * (a + c + q(+1)) + mu * q(+1);
    q = betap * (alpha * (z + kp)^(alpha - 1) + q(+1));
    nu = (1 - theta) * betaFI * (R(+1) - 1/betap) + betaFI * theta * chi(+1) * nu(+1);
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);
    phi = eta / (rho - nu);
    b = phi * N * (1 + eb);
    eb = eb_star + gamma_q*(q-q_ss) + gamma_N*(N-N_ss) + gamma_b*(b-b_ss);
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;
    chi = phi / phi(-1) * zeta;
    N = Ne + Nn;
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1)*(1-eN);
    Nn = omega * b(-1);
    x + m * xp + R(-1)*b(-1) + m*bp(-1) / betap = Y + m * (1 - theta - omega) * b(-1);
    Y = (a + c) * k(-1) + m * (z + kp)^alpha;
    k + m * kp = Kbar;
    b + m * bp(+1) = N;
end;

shocks;
    var eN = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=10,ar=0,TeX)
q k R b x varphi mu kp chi nu eta zeta N phi Ne Nn xp bp Y;

