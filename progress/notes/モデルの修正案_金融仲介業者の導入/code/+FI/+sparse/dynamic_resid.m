function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = FI.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(20, 1);
    residual(1) = (y(21)*(y(22)-y(2))+y(3)*y(4)+y(25)-y(2)*params(6)) - (y(2)*params(5)+y(24));
    residual(2) = (y(24)*y(23)) - (y(22)*y(41));
    residual(3) = (y(25)) - (y(2)*params(6));
    residual(4) = (1+y(26)) - (y(23)*(params(1)*(1+y(46))+y(27)));
    residual(5) = (y(21)*(1+y(26))+y(46)*params(6)*params(1)) - (params(1)*(1+y(46))*(y(41)+params(6)+params(5))+y(41)*y(27));
    residual(6) = (y(21)) - (params(2)*(y(41)+params(4)*(params(7)+y(28))^(params(4)-1)));
    residual(7) = (y(30)) - ((1-params(8))*params(3)*(y(43)-T(1))+params(8)*params(3)*y(49)*y(50));
    residual(8) = (y(31)) - (1-params(8)+params(8)*params(3)*y(52)*y(51));
    residual(9) = (y(34)) - (y(31)/(params(10)-y(30)));
    residual(10) = (y(24)) - (y(34)*y(33)*(1+y(40)));
    residual(11) = (y(40)) - (params(13)+params(17)*(y(21)-params(20))+params(18)*(y(33)-params(35))+params(19)*(y(24)-params(23)));
    residual(12) = (y(32)) - (T(1)+(y(43)-T(1))*y(34));
    residual(13) = (y(29)) - (y(32)*y(34)/y(14));
    residual(14) = (y(33)) - (y(35)+y(36));
    residual(15) = (y(35)) - (params(8)*(T(1)+y(14)*(y(23)-T(1)))*y(13)*(1-x(1)));
    residual(16) = (y(36)) - (y(4)*params(9));
    residual(17) = (y(3)*y(4)+y(25)+params(11)*y(37)+params(11)*y(18)/params(2)) - (y(39)+y(4)*params(11)*(1-params(8)-params(9)));
    residual(18) = (y(39)) - (y(2)*(params(6)+params(5))+params(11)*(params(7)+y(28))^params(4));
    residual(19) = (y(22)+y(28)*params(11)) - (params(12));
    residual(20) = (y(24)+params(11)*y(58)) - (y(33));
end
