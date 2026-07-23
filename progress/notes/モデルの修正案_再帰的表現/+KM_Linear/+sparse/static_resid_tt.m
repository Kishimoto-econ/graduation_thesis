function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 2
    T = [T; NaN(2 - size(T, 1), 1)];
end
T(1) = params(10)*params(4)*params(1)*(params(1)-1)*(params(10)+params(8))^(params(1)-2);
T(2) = params(10)*params(1)*params(2)*(params(10)+params(8))^(params(1)-1);
end
