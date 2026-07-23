function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = KM_Linear.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(10, 1);
    residual(1) = (params(12)*params(9)*y(6)+params(11)/params(4)*y(3)+params(13)*y(9)) - ((params(12)*params(9)+params(9)*(params(6)+params(7)))*y(1)+params(11)*y(8));
    residual(2) = (y(8)) - (y(6)+y(14)-x(it_, 1));
    residual(3) = (y(9)) - (y(1));
    residual(4) = (y(5)) - (params(5)/params(4)*y(15)+1/params(4)*y(11));
    residual(5) = (params(12)*(1+params(16))*y(4)+params(12)*y(5)+y(15)*params(7)*params(5)) - (y(14)*params(12)*(params(5)*(1+params(16))+params(15))+y(15)*params(5)*(params(12)+params(6)+params(7))+y(11)*params(12)*params(15)-x(it_, 1)*params(12)*params(15));
    residual(6) = (params(12)*y(4)) - (T(1)*y(7)+y(14)*params(12)*params(4));
    residual(7) = (params(13)*y(9)+params(2)*params(14)*y(10)) - (params(9)*(params(6)+params(7))*y(1)+T(2)*y(2));
residual(8) = params(9)*y(6)+y(7)*params(10)*params(2);
    residual(9) = (y(12)) - (y(9)+params(2)*y(10));
    residual(10) = (y(13)) - (y(12));

end
