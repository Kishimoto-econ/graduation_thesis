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

    // 補助変数
    R_f
    q_f
    k_p
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
    b_ss
    N_ss
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
    gamma_b = -0.1;
    Kbar    = 1;

model;

    // 補助変数
    R_f = R(+1);
    q_f = q(+1);
    k_p = k(-1);

    // (1) Farmer: Budget constraint
    q * (k - k(-1)) + R * b(-1) + x - c * k(-1) = a * k(-1) + b;

    // (2) Farmer: Borrowing constraint (Occbin)
    [name = 'borrowing', bind = 'borrowing']
    mu = 0;
    [name = 'borrowing', relax = 'borrowing']
    R_f * b = q_f * k;

    // (3) Farmer: Consumption constraint (Occbin)
    [name = 'consumption', bind = 'cons']
    varphi = 0;
    [name = 'consumption', relax = 'cons']
    x = c * k(-1);

    // (4) Farmer: 自家消費制約のオイラー方程式
    1 + varphi = (beta * (1 + varphi(+1)))*R(+1) + mu * R;

    // (5) Farmer: 不動産価格のオイラー方程式
    q * (1 + varphi) + beta * c * varphi(+1) = beta * (1 + varphi(+1)) * (a + c + q(+1)) + mu * q(+1);

    // (6) Gatherer: Asset pricingのオイラー方程式
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
    eb = gamma_q*(q(-1)-q_ss) + gamma_N*(N(-1)-N_ss) + gamma_b*(b(-1)-b_ss);

    // (12) FI: Excess return
    zeta = (R(+1) - 1 / betap) * phi + 1 / betap;

    // (13) FI: Growth rate of net worth
    chi = phi / phi(-1) * zeta;

    // (14) FI: Total net worth
    N = Ne + Nn;

    // (15) FI: Existing bankers' net worth with NPL shock
    Ne = theta * ((R - 1/betap) * phi(-1) + 1/betap) * N(-1)*(1-eN);

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

// Occbin 制約条件の設定
occbin_constraints;
    // 借入制約の非バインド条件
    name 'borrowing';
    relax mu < 0;
    bind R_ss*b + b_ss*R_f - R_ss*b_ss < q_ss*k + k_ss*q_f - q_ss*k_ss;

    // 消費制約の非バインド条件
    name 'cons';
    relax varphi < 0;
    bind x > c*k_p;
end;

shocks;
    var eN = 0.001;
end;

steady;
check;

// Occbin によるシミュレーション実行設定
shocks(surprise);
    var eN;
    periods 1;
    values 0.01;
end;

occbin_setup(simul_periods=100, simul_maxit=50, simul_check_ahead_periods=200);
occbin_solver;
occbin_graph q k R b x mu varphi Y;

