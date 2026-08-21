close all

var
    q
    k
    R
    Rp
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
    eN
;

varexo 
    ep_N
    eY
    eq
;

parameters
    beta        // Discount factor of Farmer
    betap       // Discount factor of Gatherer
    betaFI      // Discount factor of FI
    alpha       // Capital share for Gatherer
    a           // Return on capital for Farmer
    c           // Non-tradable Return on capital for Farmer
    theta       // Survival probability of bankers
    omega       // Transfer rate to new bankers
    rho         // Parameter in FI's leverage equation
    Kbar        // Total real estate

    // Substitute Parameters
    A           
    B           
    C           

    // Policy Parameters
    gamma_q     
    gamma_N

    // Steady State
    Rp_ss       
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
    beta    = 0.980;
    betap   = 0.990;
    betaFI  = 0.985;
    alpha   = 0.495;
    a       = 0.438;
    c       = 0.00921;
    theta   = 0.972;
    omega   = 0.00200;
    rho     = 0.381;
    gamma_q = 0;
    gamma_N = 0;
    Kbar    = 6;

    // Steady state calculation
    eb_ss           = 0;
    Rp_ss           = 1/betap + omega;
    
    // Updated Coefficients for the quadratic equation
    A               = rho * betaFI * theta^2;
    B               = -rho * theta * (1 + betaFI * (1 + omega)) - omega * (1 - theta) * betaFI;
    C               = rho * (1 + omega) - omega * (1 - theta) * (1 - betaFI * Rp_ss);

    // Steady state Values
    zeta_ss         = (-B - sqrt((B^2 - 4*A*C))) / (2*A);
    phi_ss          = omega / (1 - theta*zeta_ss + omega);
    eta_ss          = (1 - theta) / (1 - betaFI*theta*zeta_ss);
    chi_ss          = zeta_ss;
    nu_ss           = eta_ss * betaFI * (zeta_ss - Rp_ss) * phi_ss;
    R_ss            = (zeta_ss - Rp_ss) * phi_ss + Rp_ss;
    q_ss            = a*R_ss / (R_ss-1);
    kp_ss           = (q_ss*(1-betap)/(alpha*betap))^(1/(alpha-1));
    k_ss            = Kbar - kp_ss;
    b_ss            = q_ss*k_ss/R_ss;
    
    N_ss            = b_ss * phi_ss;
    bp_ss           = b_ss - N_ss;
    Nn_ss           = omega * bp_ss;
    Ne_ss           = N_ss - Nn_ss;
    
    x_ss            = c*k_ss;
    varphi_ss       = (beta*(a+c)-a) / (a*(1-beta));
    mu_ss           = (1+varphi_ss)*(1/R_ss - beta);
    
    // Updated Gatherer consumption steady state
    xp_ss           = kp_ss^alpha + (1-theta)*zeta_ss*N_ss + (Rp_ss - 1 - omega)*bp_ss;
    Y_ss            = x_ss + xp_ss;

model;

    // (1) Farmer: Budget constraint
    q * (k - k(-1)) * (1-eq) + R(-1)* b(-1) + x = (1-eY) * (a+c) * k(-1) + b;

    // (2) Farmer: Borrowing constraint
    R * b = q(+1) * k;

    // (3) Farmer: Consumption
    x = c * k(-1);

    // (4) Farmer: Euler's equation of self-consumption constraints
    1 + varphi = (beta * (1 + varphi(+1)) + mu) * R;

    // (5) Farmer: Euler's equation of asset price
    q * (1 + varphi) * (1-eq) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * ((1-eY)*(a + c) + q(+1)) + mu * q(+1);

    // (6) Gatherer: Budget constraint
    q * (kp-kp(-1)) * (1-eq) + bp + xp = kp(-1)^alpha * (1-eY) + (1-theta)*((R - Rp) / phi(-1) + Rp) * N(-1) - omega*bp(-1) + Rp(-1)*bp(-1);

    //
    Rp = (1/betap + omega);

    // (7) Gatherer: Euler's equation of Asset pricing
    q * (1-eq) = betap * ((1-eY)*alpha * kp^(alpha - 1) + q(+1));

    // (8) FI: Marginal value of extending loans
    nu = (1 - theta) * betaFI * (R - Rp) + betaFI * theta * chi(+1) * nu(+1);

    // (9) FI: Marginal value of net worth
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);

    // (10) FI: Leverage ratio
    phi = ((rho - nu) / eta) * (1 + eb);

    // (11) FI: Aggregate loan with credit policy
    b = N / phi;

    // (12) Credit policy rule
    eb = gamma_q * (log(q(-1)/q_ss)) 
       + gamma_N * (log(N(-1)/N_ss));

    // (13) FI: growth rate of net worth
    zeta = (R(-1) - Rp(-1)) / phi(-1) + Rp(-1);

    // (14) FI: Growth rate of lending
    chi = phi(-1) / phi * zeta;

    // (15) FI: Total net worth
    N = Ne + Nn;

    // (16) FI: Existing bankers' net worth with NPL shock
    Ne = (theta * ((R(-1) - Rp(-1)) / phi(-1) + Rp(-1)) * N(-1))*(1-eN);

    // (17) FI: New bankers' net worth
    Nn = omega * bp(-1);

    // (18) Market clearing: Total output
    Y = x + xp;

    // (19) Market clearing: Capital
    k + kp = Kbar;

    // (20) Market clearing: Bond
    b = N + bp;

    eN = 0.8*eN(-1) + ep_N;

end;

initval;
    Rp      = Rp_ss;
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
    var ep_N = 0.01^2;
   // var eY = 0.01^2;
  //  var eq = 0.01^2;
end;

steady;
check;

stoch_simul(order=1,irf=100,ar=0,TeX) //,nograph)
q k R b x kp N xp bp Y phi eb eN
;