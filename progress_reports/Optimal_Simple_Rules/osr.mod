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
    eb      $\varepsilon^b$
;

varexo 
    eN      $\varepsilon^N$
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
    eb_star     // Policy steady state
    eb_ss       // Policy in steady state

    // Substitute Parameters
    A           // rho*betaFI*theta^2
    B           // -rho*theta*(1+betaFI)-omega*(1-theta)*betaFI
    C           // rho-omega*(1-theta)*(1-betaFI/betap)

    // Policy Parameters
    gamma_q     // Policy reaction to real estate price
    gamma_N     // Policy reaction to net worth of FI
    gamma_b     // Policy reaction to total borrowing of farmer

    // Steady State
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
;

    // values
    beta    = 0.99;
    betap   = 0.98;
    betaFI  = 0.985;
    alpha   = 1/3;
    a       = 0.7;
    c       = 0.3;
    z       = 0.01;
    theta   = 0.95;
    omega   = 0.002;
    rho     = 0.4;
    m       = 0.5;
    gamma_q = -0.1;
    gamma_N = 0.1;
    gamma_b = 0.1;
    Kbar    = 1;
    eb_star = 0;
    A       = rho*betaFI*theta^2;
    B       = - rho*theta*(1+betaFI) - omega*(1-theta)*betaFI;
    C       = rho - omega*(1-theta)*(1-betaFI/betap);

    // Stady state Values
    eb_ss           = 0;
    zeta_ss         = (-B - sqrt((B^2 - 4*A*C))) / (2*A);
    phi_ss          = (1-theta*zeta_ss) / omega;
    eta_ss          = (1-theta)/(1-betaFI*theta*zeta_ss);
    chi_ss          = zeta_ss;
    nu_ss           = eta_ss * betaFI * (zeta_ss-1/betap)/phi_ss;
    R_ss            = (zeta_ss-1/betap)/phi_ss + 1/betap;
    q_ss            = a*R_ss / (R_ss-1);
    kp_ss           = (q_ss*(1-betap)/(alpha*betap))^(1/(alpha-1)) - z;
    k_ss            = Kbar - m*kp_ss;
    b_ss            = q_ss*k_ss/R_ss;
    N_ss            = b_ss/phi_ss;
    Nn_ss           = omega*b_ss;
    Ne_ss           = N_ss - Nn_ss;
    x_ss            = c*k_ss;
    Y_ss            = (a+c)*k_ss + m*(z+kp_ss)^alpha;
    varphi_ss       = (beta*(a+c)-a) / (a*(1-beta));
    mu_ss           = (1+varphi_ss)*(1/R_ss - beta);
    bp_ss           = b_ss/m*((1-phi_ss)/phi_ss);
    xp_ss           = (Y_ss + m*(1-theta-omega)*b_ss - x_ss - R_ss*b_ss-m/betap*bp_ss)/m;

model;

    // (1) Farmer: Budget constraint
    q * (k - k(-1)) + R * b(-1) + x - c * k(-1) = a * k(-1) + b;

    // (2) Farmer: Borrowing constraint
    R(+1) * b = q(+1) * k;

    // (3) Farmer: Consumption
    x = c * k(-1);

    // (4) Farmer: 自家消費制約のオイラー方程式
    1 + varphi = (beta * (1 + varphi(+1)))*R(+1) + mu * R;

    // (5) Farmer: 不動産価格のオイラー方程式
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * (a + c + q(+1)) + mu * q(+1);

    // (6) Gatherer: Asset pricing
    q = betap * (alpha * (z + kp)^(alpha - 1) + q(+1));

    // (7) FI: Marginal value of net worth
    nu = (1 - theta) * betaFI * (R(+1) - 1/betap) + betaFI * theta * chi(+1) * nu(+1);

    // (8) FI: Marginal value of extending loans
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);

    // (9) FI: Leverage ratio
    phi = eta / (rho - nu);

    // (10) FI: Aggregate loan with credit policy
    b = phi * N * (1 + eb);

    // (11) Credit policy rule
    eb = eb_star - gamma_q*(q(-1)-q_ss) - gamma_N*(N(-1)-N_ss) - gamma_b*(b(-1)-b_ss);

    // (12) FI: Excess return
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;

    // (13) FI: Growth rate of net worth
    chi = phi / phi(-1) * zeta;

    // (14) FI: Total net worth
    N = (Ne + Nn)*(1-eN);

    // (15) FI: Existing bankers' net worth with NPL shock
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1);

    // (16) FI: New bankers' net worth
    Nn = omega * b(-1);

    // (17) Market clearing: Resource constraint
    x + m * xp + R*b(-1) + m*bp(-1) / betap = Y + m * (1 - theta - omega) * b(-1);

    // (18) Market clearing: Total output
    Y = (a + c) * k(-1) + m * (z + kp(-1))^alpha;

    // (19) Market clearing: Capital
    k + m * kp = Kbar;

    // (20) Market clearing: Bond
    b + m * bp = N;

end;

initval;
    q       = q_ss;
    k       = k_ss;
    R       = R_ss;
    b       = b_ss;
    x       = x_ss;
    varphi  = varphi_ss;
    mu      = mu_ss;
    kp      = kp_ss;
    chi     = chi_ss;
    nu      = nu_ss;
    eta     = eta_ss;
    zeta    = zeta_ss;
    N       = N_ss;
    phi     = phi_ss;
    Ne      = Ne_ss;
    Nn      = Nn_ss;   
    xp      = xp_ss;
    bp      = bp_ss;
    Y       = Y_ss;
    eb      = eb_ss;
end;

shocks;
    var eN = 0.01^2;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=200,ar=0,TeX)
q k R b x varphi mu kp chi nu eta zeta N phi Ne Nn xp bp Y
;

optim_weights;
    q   1;
    Y   1;
end;

osr_params
    eb_star
    gamma_q
    gamma_N
    gamma_b
;

osr(irf=10);


