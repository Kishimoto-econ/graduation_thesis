close all

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

    b_obs
    Y_obs
;

varexo 
    eN      $\varepsilon^N$
    eY      $\varepsilon^Y$
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
    eb_ss       // Policy in steady state

    // Substitute Parameters
    A           // rho*betaFI*theta^2
    B           // -rho*theta*(1+betaFI)-omega*(1-theta)*betaFI
    C           // rho-omega*(1-theta)*(1-betaFI/betap)

    // Policy Parameters
    gamma_q     $\gamma_q$  // Policy reaction to real estate price
    gamma_N     $\gamma_N$  // Policy reaction to net worth of FI
    gamma_b     $\gamma_b$  // Policy reaction to total borrowing of farmer

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
    beta    = 0.980;
    betap   = 0.990;
    betaFI  = 0.985;
    alpha   = 0.495;
    a       = 0.438;
    c       = 0.00921;
    theta   = 0.972;
    omega   = 0.00200;
    rho     = 0.381;
    gamma_q = -0.1;
    gamma_N = 0.1;
    gamma_b = -0.1;
    Kbar    = 6.62;
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
    kp_ss           = (q_ss*(1-betap)/(alpha*betap))^(1/(alpha-1));
    k_ss            = Kbar - kp_ss;
    b_ss            = q_ss*k_ss/R_ss;
    N_ss            = b_ss/phi_ss;
    Nn_ss           = omega*b_ss;
    Ne_ss           = N_ss - Nn_ss;
    x_ss            = c*k_ss;
    Y_ss            = (a+c)*k_ss + kp_ss^alpha;
    varphi_ss       = (beta*(a+c)-a) / (a*(1-beta));
    mu_ss           = (1+varphi_ss)*(1/R_ss - beta);
    bp_ss           = b_ss/((1-phi_ss)/phi_ss);
    xp_ss           = (Y_ss + (1-theta-omega)*b_ss - x_ss - R_ss*b_ss-bp_ss/betap);

model;
    
    // 観測方程式
    b_obs = log(b) - log(b(-1));
    Y_obs = log(Y) - log(Y(-1));

    // (1) Farmer: Budget constraint
    q * (k - k(-1)) + R * b(-1) + x = (1-eY(+1)) * (a+c) * k(-1) + b;

    // (2) Farmer: Borrowing constraint
    R(+1) * b = q(+1) * k;

    // (3) Farmer: Consumption
    x = c * k(-1);

    // (4) Farmer: Euler's equation of self-consumption constraints
    1 + varphi = (beta * (1 + varphi(+1)))*R(+1) + mu * R;

    // (5) Farmer: Euler's equation of asset price
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * ((1-eY)*(a + c) + q(+1)) + mu * q(+1);

    // (6) Gatherer: Budget constraint
    q * (kp-kp(-1)) + bp(-1) / betap + xp = kp(-1)^alpha + (1-theta-omega) * b(-1) + bp;

    // (7) Gatherer: Euler's equation of Asset pricing
    q = betap * ((1-eY(+1))*alpha * kp^(alpha - 1) + q(+1));

    // (8) FI: Marginal value of extending loans
    nu = (1 - theta) * betaFI * (R(+1) - 1/betap) + betaFI * theta * chi(+1) * nu(+1);

    // (9) FI: Marginal value of net worth
    eta = (1 - theta) + betaFI * theta * zeta(+1) * eta(+1);

    // (10) FI: Leverage ratio
    phi = (eta / (rho - nu)) * (1 + eb);

    // (11) FI: Aggregate loan with credit policy
    b = phi * N;

    // (12) Credit policy rule
    eb = gamma_q*(q(-1)-q_ss) + gamma_N*(N(-1)-N_ss) + gamma_b*(b(-1)-b_ss);

    // (13) FI: growth rate of net worth
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;

    // (14) FI: Growth rate of lending
    chi = phi / phi(-1) * zeta;

    // (15) FI: Total net worth
    N = (Ne + Nn);

    // (16) FI: Existing bankers' net worth with NPL shock
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1)*(1-eN);

    // (17) FI: New bankers' net worth
    Nn = omega * b(-1);

    // (18) Market clearing: Total output
    Y = (1-eY)*(a + c) * k(-1) + kp(-1)^alpha;

    // (19) Market clearing: Capital
    k + kp = Kbar;

    // (20) Market clearing: Bond
    b + bp = N;

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
    var eY = 0.01^2;
end;

steady;
check;

estimated_params;

    // Policy parameters
    gamma_q,  normal_pdf, 0,  0.05;
    gamma_N,  normal_pdf, 0,  0.05;
    gamma_b,  normal_pdf, 0,  0.05;
    
    stderr eN, inv_gamma_pdf, 0.01, 0.005;
    stderr eY, inv_gamma_pdf, 0.01, 0.005;

end;

estimated_params_init(use_calibration);
end;

varobs b_obs Y_obs;

identification;

estimation(datafile='dset.mat', mh_replic=125000,
mh_drop = 0.2, mh_nblocks=2, mh_jscale=0.6, mode_compute = 6, mode_check, Tex);

// save figures
FolderName = "C:\Users\Kohsu\Desktop\graduation_thesis\progress\code\mcmc\output";
FigHandles =  findobj('type','figure');
nFig = length(FigHandles);
for iFig = 1:nFig
  h = FigHandles(iFig);
  FigName  = get(h, 'Name');
  savefig(h, fullfile(FolderName, [FigName,'.fig']));
end