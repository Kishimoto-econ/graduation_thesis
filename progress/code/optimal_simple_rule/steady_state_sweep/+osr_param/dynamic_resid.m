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
    T = osr_param.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(20, 1);
    residual(1) = (y(8)*(y(9)-y(2))+y(10)*y(3)+y(12)-y(2)*params(6)) - (y(2)*params(5)+y(11));
    residual(2) = (y(11)*y(29)) - (y(9)*y(28));
    residual(3) = (y(12)) - (y(2)*params(6));
    residual(4) = (1+y(13)) - (y(29)*params(1)*(1+y(30))+y(10)*y(14));
    residual(5) = (y(8)*(1+y(13))+y(30)*params(6)*params(1)) - (params(1)*(1+y(30))*(y(28)+params(6)+params(5))+y(28)*y(14));
    residual(6) = (y(8)) - (params(2)*(y(28)+params(4)*(params(7)+y(15))^(params(4)-1)));
    residual(7) = (y(17)) - ((1-params(8))*params(3)*(y(29)-T(1))+params(8)*params(3)*y(31)*y(32));
    residual(8) = (y(18)) - (1-params(8)+params(8)*params(3)*y(34)*y(33));
    residual(9) = (y(21)) - (y(18)/(params(10)-y(17)));
    residual(10) = (y(11)) - (y(21)*y(20)*(1+y(27)));
    residual(11) = (y(27)) - (params(17)*(y(1)-params(20))+params(18)*(y(5)-params(35))+params(19)*(y(3)-params(23)));
    residual(12) = (y(19)) - (T(1)+(y(29)-T(1))*y(21));
    residual(13) = (y(16)) - (y(19)*y(21)/y(6));
    residual(14) = (y(20)) - (y(22)+y(23));
    residual(15) = (y(22)) - (y(5)*params(8)*(T(1)+y(6)*(y(10)-T(1)))*(1-x(it_, 1)));
    residual(16) = (y(23)) - (y(3)*params(9));
    residual(17) = (y(10)*y(3)+y(12)+params(11)*y(24)+params(11)*y(7)/params(2)) - (y(26)+y(3)*params(11)*(1-params(8)-params(9)));
    residual(18) = (y(26)) - (y(2)*(params(6)+params(5))+params(11)*(params(7)+y(4))^params(4));
    residual(19) = (y(9)+y(15)*params(11)) - (params(12));
    residual(20) = (y(11)+params(11)*y(25)) - (y(20));

end
