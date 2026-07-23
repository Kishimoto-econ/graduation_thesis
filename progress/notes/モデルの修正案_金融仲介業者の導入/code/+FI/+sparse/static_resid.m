function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = FI.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(20, 1);
    residual(1) = (y(3)*y(4)+y(5)-y(2)*params(6)) - (y(4)+y(2)*params(5));
    residual(2) = (y(3)*y(4)) - (y(1)*y(2));
    residual(3) = (y(5)) - (y(2)*params(6));
    residual(4) = (1+y(6)) - (y(3)*((1+y(6))*params(1)+y(7)));
    residual(5) = (y(1)*(1+y(6))+y(6)*params(6)*params(1)) - ((1+y(6))*params(1)*(y(1)+params(6)+params(5))+y(1)*y(7));
    residual(6) = (y(1)) - (params(2)*(y(1)+params(4)*(params(7)+y(8))^(params(4)-1)));
    residual(7) = (y(10)) - ((1-params(8))*params(3)*T(1)+y(10)*params(8)*params(3)*y(9));
    residual(8) = (y(11)) - (1-params(8)+y(11)*params(8)*params(3)*y(12));
    residual(9) = (y(14)) - (y(11)/(params(10)-y(10)));
    residual(10) = (y(4)) - (y(14)*y(13)*(1+y(20)));
    residual(11) = (y(20)) - (params(13)+params(17)*(y(1)-params(20))+params(18)*(y(13)-params(35))+params(19)*(y(4)-params(23)));
    residual(12) = (y(12)) - (T(2));
    residual(13) = (y(9)) - (y(12));
    residual(14) = (y(13)) - (y(15)+y(16));
    residual(15) = (y(15)) - (y(13)*params(8)*T(2)*(1-x(1)));
    residual(16) = (y(16)) - (y(4)*params(9));
    residual(17) = (y(3)*y(4)+y(5)+params(11)*y(17)+params(11)*y(18)/params(2)) - (y(19)+y(4)*params(11)*(1-params(8)-params(9)));
    residual(18) = (y(19)) - (y(2)*(params(6)+params(5))+params(11)*(params(7)+y(8))^params(4));
    residual(19) = (y(2)+y(8)*params(11)) - (params(12));
    residual(20) = (y(4)+params(11)*y(18)) - (y(13));
end
