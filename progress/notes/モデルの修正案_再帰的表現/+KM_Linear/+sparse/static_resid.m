function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = KM_Linear.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(10, 1);
    residual(1) = (params(12)*params(9)*y(3)+params(11)/params(4)*y(5)+params(13)*y(6)) - (y(3)*(params(12)*params(9)+params(9)*(params(6)+params(7)))+params(11)*y(5));
    residual(2) = (y(5)) - (y(3)+y(1)-x(1));
    residual(3) = (y(6)) - (y(3));
    residual(4) = (y(2)) - (y(2)*params(5)/params(4)+1/params(4)*y(8));
    residual(5) = (y(1)*params(12)*(1+params(16))+params(12)*y(2)+y(2)*params(7)*params(5)) - (y(1)*params(12)*(params(5)*(1+params(16))+params(15))+y(2)*params(5)*(params(12)+params(6)+params(7))+y(8)*params(12)*params(15)-x(1)*params(12)*params(15));
    residual(6) = (params(12)*y(1)) - (T(1)*y(4)+y(1)*params(12)*params(4));
    residual(7) = (params(13)*y(6)+params(2)*params(14)*y(7)) - (y(3)*params(9)*(params(6)+params(7))+y(4)*T(2));
residual(8) = params(9)*y(3)+y(4)*params(10)*params(2);
    residual(9) = (y(9)) - (y(6)+params(2)*y(7));
    residual(10) = (y(10)) - (y(9));
end
