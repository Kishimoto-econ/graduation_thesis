function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = KM_Linear.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(10, 1);
    residual(1) = (params(12)*params(9)*y(13)+params(11)/params(4)*y(5)+params(13)*y(16)) - ((params(12)*params(9)+params(9)*(params(6)+params(7)))*y(3)+params(11)*y(15));
    residual(2) = (y(15)) - (y(13)+y(21)-x(1));
    residual(3) = (y(16)) - (y(3));
    residual(4) = (y(12)) - (params(5)/params(4)*y(22)+1/params(4)*y(18));
    residual(5) = (params(12)*(1+params(16))*y(11)+params(12)*y(12)+y(22)*params(7)*params(5)) - (y(21)*params(12)*(params(5)*(1+params(16))+params(15))+y(22)*params(5)*(params(12)+params(6)+params(7))+y(18)*params(12)*params(15)-x(1)*params(12)*params(15));
    residual(6) = (params(12)*y(11)) - (T(1)*y(14)+y(21)*params(12)*params(4));
    residual(7) = (params(13)*y(16)+params(2)*params(14)*y(17)) - (params(9)*(params(6)+params(7))*y(3)+T(2)*y(4));
residual(8) = params(9)*y(13)+y(14)*params(10)*params(2);
    residual(9) = (y(19)) - (y(16)+params(2)*y(17));
    residual(10) = (y(20)) - (y(19));
end
