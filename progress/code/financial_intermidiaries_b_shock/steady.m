function [X_ss, FVAL] = solve_steady_state()
    %% 1. パラメータの定義
    p.betap  = 0.985;
    p.c      = 0.3;
    p.a      = 0.7;
    p.beta   = 0.99;
    p.alpha  = 1/3;
    p.z      = 0.01;
    p.betaFI = 0.98;
    p.theta  = 0.95;
    p.rho    = 0.4;
    p.omega  = 0.002;
    p.m      = 0.5;
    p.K_bar  = 1;
    p.delta     = 0.9;
    p.epsb_star = 0;
    p.gamma_q   = 0.1;
    p.q_star    = 33;
    p.gamma_N   = 0.5;
    p.N_star    = 5.3;
    p.gamma_b   = 0.1;
    p.b_star    = 24;

    %% 2. 初期値の推測（Initial Guess）
    % X = [q, k, R, b, x, varphi, mu, kp, kai, nu, eta, zeta, N, phi, Ne, Nn, xp, bp, Y]
    X0 = zeros(19, 1);
    X0(1) = 35.7;      % q
    X0(2) = 0.75772;     % k
    X0(3) = 1.02;    % R
    X0(4) = 26.5027;     % b
    X0(5) = 0.227316;     % x
    X0(6) = 41.429;      % varphi
    X0(7) = -0.40765;    % mu
    X0(8) = 0.48456;     % kp
    X0(9) = 1.02994;     % kai
    X0(10) = 0.00568526;    % nu
    X0(11) = 1.2158;     % eta
    X0(12) = 1.02994;    % zeta
    X0(13) = 8.59551;     % N
    X0(14) = 3.08332;     % phi
    X0(15) = 8.41021;     % Ne
    X0(16) = 0.1853;     % Nn
    X0(17) = 56.6834;     % xp
    X0(18) = -53.004;    % bp
    X0(19) = 1.15313;    % Y


    %% 3. fsolveによる非線形方程式の求解
    options = optimoptions('fsolve', 'Display', 'iter', 'MaxFunctionEvaluations', 20000, 'MaxIterations', 2000);
    [X_ss, FVAL, exitflag] = fsolve(@(X) model_eqs(X, p), X0, options);
    
    if exitflag > 0
        disp('========================================');
        disp('定常状態の計算に成功しました！');
        disp('========================================');
        var_names = {'q', 'k', 'R', 'b', 'x', 'varphi', 'mu', 'kp', 'kai', 'nu', 'eta', 'zeta', 'N', 'phi', 'Ne', 'Nn', 'xp', 'bp', 'Y'};
        for i = 1:19
            fprintf('%6s = %10.6f\n', var_names{i}, X_ss(i));
        end
    else
        disp('収束しませんでした。方程式か初期値を見直してください。');
    end
end

function F = model_eqs(X, p)
    % 変数の展開
    q      = X(1);  k      = X(2);  R      = X(3);  b      = X(4);
    x      = X(5);  varphi = X(6);  mu     = X(7);  kp     = X(8);
    kai    = X(9);  nu     = X(10); eta    = X(11); zeta   = X(12);
    N      = X(13); phi    = X(14); Ne     = X(15); Nn     = X(16);
    xp     = X(17); bp     = X(18); Y      = X(19);

    F = zeros(19, 1);

    % 定常状態の方程式
    F(1)  = R*b + x - p.c*k - (p.a*k + b);
    F(2)  = R*b - q*k;
    F(3)  = x - p.c*k;
    F(4)  = 1 + varphi - (p.beta*(1 + varphi) + mu)*R;
    F(5)  = q*(1 + varphi) + p.beta*p.c*varphi - (p.beta*(1 + varphi)*(p.a + p.c + q) + mu*q);
    F(6)  = q - p.betap*(p.alpha*(p.z + kp)^(p.alpha - 1) + q);
    F(7)  = nu - ((1 - p.theta)*p.betaFI*(R - 1/p.betap) + p.betaFI*p.theta*kai*nu);
    F(8)  = eta - ((1 - p.theta) + p.betaFI*p.theta*zeta*eta);
    F(9)  = phi - eta/(p.rho - nu);
    F(10) = b - phi*N;
    F(11) = zeta - ((R - 1/p.betap)*phi + 1/p.betap);
    F(12) = kai - zeta; 
    F(13) = N - (Ne + Nn);
    F(14) = Ne - p.theta*((R - 1/p.betap)*phi + 1/p.betap)*N;
    F(15) = Nn - p.omega*b;
    F(16) = x + p.m*xp + b/p.betap + bp/p.betap - (Y + p.m*(1 - p.theta - p.omega)*b);
    F(17) = Y - ((p.a + p.c)*k + p.m*(p.z + kp)^p.alpha);
    F(18) = k + p.m*kp - p.K_bar;
    F(19) = b + p.m*bp;
end