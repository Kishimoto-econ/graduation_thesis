var x   ${x}$           (long_name='consumption farmer')
    xp  ${x^\prime}$    (long_name='consumption gatherer')
    b   $b$             (long_name='bonds')
    k   ${k}$           (long_name='Land held by farmer')
    kp  ${k^\prime}$    (long_name='Land held by gatherer')
    q   $q$             (long_name='fruit price')
    mu  $\mu$           (long_name='multiplier enforceability constraint')  
    phi $\phi$          (long_name='multiplier consumption constraint farmer')  
    Y   $Y$             (long_name='aggregate output')
    R
;

varexo eb $\varepsilon$;

parameters alpha $\alpha$           (long_name='exponent production function gatherers')
    K_bar       $\bar K$            (long_name='land supply')
    beta        $\beta$             (long_name='discount factor farmer')
    betap       ${\beta^\prime}$    (long_name='discount factor farmer')
    a           $a$    
    p
    b_bar
    ;

alpha = 1/3;
m = 0.5;
K_bar = 1;
betap = 0.99;
beta = 0.98;
a = 0.7;
c = 0.3;
z = 0.01;
p = 0.3;
b_bar = 2;

model;

q*(k-k(-1)) + R*b(-1) + x - k(-1)^alpha - b = 0;

R = alpha*k(-1)^(alpha-1) + 1;

b = (p*R + b_bar)*(1-eb);

1/x - phi - beta*R/x(+1) = 0;

-1/x*q + beta/x(+1)*(q(+1)+alpha*k^(alpha-1)) + beta*mu(+1)*alpha*(alpha-1)*k^(alpha-2) = 0;

betap*xp*R(+1) = xp(+1);

xp*beta*(q(+1)+a) = q*xp(+1);

x + xp = k(-1)^alpha + a*kp(-1);

Y = x + xp;

k + kp = K_bar;

end;

shocks;
var eb = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=12,ar=0,TeX) k kp Y q mu b phi;

