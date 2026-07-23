var
    x   ${x}$           (long_name='consumption farmer')
    xp  ${x^\prime}$    (long_name='consumption gatherer')
    b   $b$             (long_name='bonds')
    k   ${k}$           (long_name='Land held by farmer')
    kp  ${k^\prime}$    (long_name='Land held by gatherer')
    q   $q$             (long_name='fruit price')
    mu  $\mu$           (long_name='multiplier enforceability constraint')  
    phi $\phi$          (long_name='multiplier consumption constraint farmer')  
    Y   $Y$             (long_name='aggregate output')
    bp
    ;

varexo eb $\varepsilon$;

parameters
    alpha       $\alpha$            (long_name='exponent production function gatherers')
    delta           $\delta$                 (long_name='資本減耗率')
    g       $g$            (long_name='資本成長率')
    beta        $\beta$             (long_name='discount factor farmer')
    betap       ${\beta^\prime}$    (long_name='discount factor Gatherer')
    a           $a$                 (long_name='tradability share')
    c           $c$                 (long_name='non-tradability share') 
    z           $z$                 (long_name='constant production function gatherers')
    ;

alpha = 1/3;
delta = 0.2;
g = 0.5;
betap = 0.99;
beta = 0.98;
a = 0.7;
c = 0.3;
z = 0.01;

model;

q*k = (1-delta)*q*k(-1) + (a+c)*k(-1) - x(-1) + b - b(-1)/betap;

b = betap*q(+1)*k*(1-eb);

x = c*k(-1);

1 + phi = beta*(mu(+1) + phi(+1) + 1) / betap;

q*(1+phi(-1)) + beta^2*c*phi(+1) = beta*(1+phi)*(a+c+(1-delta)*q) + beta*mu*q(+1)*(1-eb);



q = betap*(alpha*(z+kp(-1))^(alpha-1) + (1-delta)*q(+1));

(k + kp)*q = (1-delta)*(k(-1)+kp(-1))*q + ((a+c)*k(-1) + (z+kp(-1))^alpha) - (x(-1)+xp(-1));

k + kp = 1.1*(k(-1)-kp(-1));

b + bp = 0;

Y = (a+c)*k(-1) + (z+kp(-1))^alpha;

end;



shocks;
var eb = 0.01;
end;

resid;
steady;
check;

stoch_simul(order=1,irf=12,ar=0,TeX) k kp Y q mu b phi;