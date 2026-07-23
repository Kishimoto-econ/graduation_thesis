var x   ${x}$           (long_name='consumption farmer')
    xp  ${x^\prime}$    (long_name='consumption gatherer')
    b   $b$             (long_name='bonds')
    k   ${k}$           (long_name='Land held by farmer')
    kp  ${k^\prime}$    (long_name='Land held by gatherer')
    q   $q$             (long_name='fruit price')
    mu  $\mu$           (long_name='multiplier enforceability constraint')  
    phi $\phi$          (long_name='multiplier consumption constraint farmer')  
    C   $C$             (long_name='aggregate consumption')
    Y   $Y$             (long_name='aggregate output')
    ;

varexo eb $\varepsilon$;

parameters alpha $\alpha$           (long_name='exponent production function gatherers')
    m           $m$                 (long_name='population size gatherers')
    K_bar       $\bar K$            (long_name='land supply')
    beta        $\beta$             (long_name='discount factor farmer')
    betap       ${\beta^\prime}$    (long_name='discount factor farmer')
    a           $a$                 (long_name='tradability share')
    c           $c$                 (long_name='non-tradability share') 
    z           $z$                 (long_name='constant production function gatherers')
    gamma;

alpha = 1/3;
m = 0.5;
K_bar = 1;
betap = 0.99;
beta = 0.98;
a = 0.7;
c = 0.3;
z = 0.01;
gamma = 100;

model;
[name='Euler equation bonds farmer']
(1 + phi)*(1-gamma*(b-b(-1))) = beta*(1+phi(+1))*(1/betap - gamma*(b-b(-1))) + mu/betap;

[name='Euler equation capital farmer']
q*(1+phi) + beta*c*phi(+1) = beta*(1+phi(+1))*((a+c)+ q(+1)) + mu*q(+1);

[name='Budget constraint']
q*(k - k(-1)) + b(-1)/betap + x + gamma/2*(b-b(-1))^2 = (a+c)*k(-1) + b;

[name='Borrowing constraint']
b = betap*q(+1)*k*(1-eb);

[name='Euler equation gatherer']
q = betap*(alpha*(z + kp)^(alpha-1) + q(+1));

[name='Resource constraint']
x + m*xp = (a+c)*k + m*(z + kp)^(alpha);

[name='Capital market-clearing']
k + m*kp = K_bar;

[name='non-tradeable constraint']
x = c*k(-1);

[name='Aggregate consumption']
C = x + m*xp;

[name='Aggregate output']
Y = C;  

end;

steady_state_model;
q = a/(1-betap);
kp = (betap*alpha/a)^(1/(1-alpha)) - z;
k = K_bar - m*kp;
b = betap*q*k;
xp = (1/m)*(a*k + m*(z + kp)^(alpha));
phi = (a*(beta-1) + beta*c)/(a*(1-beta));
mu = (betap-beta)*beta*c/(a*(1-beta));
x = c*k;
C = x + m*xp;
Y = C;
end;

shocks;
var eb = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=12,ar=0,TeX) k kp Y q mu b phi;