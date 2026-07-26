var 
    // Farmer
    k_hat       $\hat{k}$ // Farmer's capital
    R_hat       $\hat{R}$ // Farmer's interest rate
    b_hat       $\hat{b}$ // Borrowing
    x_hat       $\hat{x}$ // Farmer's consumption
    varphi_hat  $\hat{\varphi}$ // Lagrange multiplier for budget constraint
    mu_hat      $\hat{\mu}$ // Lagrange multiplier for borrowing constraint

    // Gatherer
    kp_hat      $\hat{k^\prime}$ // Gatherer's capital
    xp_hat      $\hat{x^\prime}$ // Gatherer's consumption
    bp_hat      $\hat{b^\prime}$ // Gatherer's deposit

    // Financial Intermediary (FI)
    nu_hat      $\hat{\nu}$ // Marginal value of net worth
    eta_hat     $\hat{\eta}$ // Marginal value of extending loans
    phi_hat     $\hat{\phi}$ // Leverage ratio
    zeta_hat    $\hat{\zeta}$ // Excess return
    chi_hat     $\hat{\chi}$ // Growth rate of net worth
    N_hat       $\hat{N}$ // FI's net worth
    Ne_hat      $\hat{N_e}$ // Existing bankers' net worth
    Nn_hat      $\hat{N_N}$ // New bankers' net worth
    
    // Policy & Aggregates
    epsilon_b   $\hat{\epsilon_b}$ // Credit policy / Lending regulation
    q_hat       $\hat{q}$ // Asset price
    Y_hat       $\hat{Y}$ // Total output
;

varexo 
    epsilon_N   // Non-performing loan (NPL) shock
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

    // Stady state Values
    epsilon_b_ss    = 0;
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

model(linear);

    // (1) Farmer: Budget constraint
    q_ss*k_ss*k_hat + R_ss*b_ss*(R_hat(-1) + b_hat(-1)) + x_ss*x_hat = (q_ss*k_ss + (a+c)*k_ss)*k_hat(-1) + b_ss*b_hat;
    
    // (2) Farmer: Borrowing constraint
    R_hat + b_hat = q_hat(+1) + k_hat;
    
    // (3) Farmer: Consumption
    x_hat = k_hat(-1);
    
    // (4) Farmer: 自家消費制約のオイラー方程式
    varphi_hat = beta*R_ss*varphi_hat(+1) + R_ss*mu_hat + (1+varphi_ss)*R_hat;
    
    // (5) Farmer: 不動産価格のオイラー方程式
    q_ss * (1+varphi_ss)* q_hat + q_ss *varphi_hat = (beta*(1+varphi_ss) + mu_ss)* q_ss *q_hat(+1) + beta*(a+q_ss)* varphi_hat(+1) + mu_ss* q_ss *mu_hat;
 
    // (6) Gatherer: Asset pricing
    q_ss*q_hat = betap*alpha*(alpha - 1)*(z + kp_ss)^(alpha - 2)*kp_ss*kp_hat + betap*q_ss*q_hat(+1);
    
    // (7) FI: Marginal value of net worth
    nu_ss*nu_hat = (1 - theta)*betaFI*R_ss*R_hat(+1) + betaFI*theta*chi_ss*nu_ss*(chi_hat(+1) + nu_hat(+1));
    
    // (8) FI: Marginal value of extending loans
    eta_ss*eta_hat = betaFI*theta*zeta_ss*eta_ss*(zeta_hat(+1) + eta_hat(+1));
    
    // (9) FI: Leverage ratio
    phi_hat = eta_hat + (nu_ss/(rho - nu_ss))*nu_hat;
    
    // (10) FI: Aggregate loan with credit policy
    b_hat = phi_hat + N_hat + epsilon_b;
    
    // (11) Credit policy rule
    epsilon_b = epsilon_b_ss + gamma_q*q_hat + gamma_N*N_hat + gamma_b*b_hat;
    
    // (12) FI: Excess return
    zeta_ss*zeta_hat(+1) = R_ss*phi_ss*(R_hat(+1) + phi_hat) - (phi_ss/betap)*phi_hat;
    
    // (13) FI: Growth rate of net worth
    chi_hat = zeta_hat + phi_hat - phi_hat(-1);
    
    // (14) FI: Total net worth
    N_ss*N_hat = Ne_ss*Ne_hat + Nn_ss*Nn_hat;
    
    // (15) FI: Existing bankers' net worth with NPL shock
    Ne_ss*Ne_hat = theta*R_ss*phi_ss*N_ss*(R_hat + phi_hat(-1) + N_hat(-1)) - (theta/betap)*phi_ss*N_ss*(phi_hat(-1) + N_hat(-1)) + theta*(N_ss/betap)*N_hat(-1) - Ne_ss*epsilon_N;
    
    // (16) FI: New bankers' net worth
    Nn_hat = b_hat(-1);
    
    // (17) Market clearing: Resource constraint
    x_ss*x_hat + m*xp_ss*xp_hat + R_ss*b_ss*R_hat(-1) = Y_ss*Y_hat + (m*(1-theta-omega)*b_ss - R_ss*b_ss)*b_hat(-1) - (m/betap)*bp_ss*bp_hat(-1);
    
    // (18) Market clearing: Total output
    Y_ss*Y_hat = (a+c)*k_ss*k_hat(-1) + m*alpha*(z + kp_ss)^(alpha - 1)*kp_ss*kp_hat;
    
    // (19) Market clearing: Capital
    k_ss*k_hat + m*kp_ss*kp_hat = 0;
    
    // (20) Market clearing: Bond
    b_ss*b_hat(-1) + m*bp_ss*bp_hat = N_ss*N_hat(-1);

end;

shocks;
    var epsilon_N = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=10,ar=0,TeX)
    q_hat
    k_hat
    R_hat
    b_hat
    x_hat
    varphi_hat
    mu_hat
    kp_hat
    chi_hat
    nu_hat
    eta_hat
    zeta_hat
    N_hat
    phi_hat
    Ne_hat
    Nn_hat
    xp_hat
    bp_hat
    Y_hat
    epsilon_b
;

optim_weights;
    q_hat 1;
    Y_hat 1;
end;

osr_params
    gamma_q
    gamma_N
    gamma_b
    ;
osr;