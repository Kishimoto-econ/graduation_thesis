function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = osr_param.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 35);
g1(1,8)=y(9)-y(2);
g1(1,2)=(-y(8))-params(6)-params(5);
g1(1,9)=y(8);
g1(1,10)=y(3);
g1(1,3)=y(10);
g1(1,11)=(-1);
g1(1,12)=1;
g1(2,28)=(-y(9));
g1(2,9)=(-y(28));
g1(2,29)=y(11);
g1(2,11)=y(29);
g1(3,2)=(-params(6));
g1(3,12)=1;
g1(4,10)=(-y(14));
g1(4,29)=(-(params(1)*(1+y(30))));
g1(4,13)=1;
g1(4,30)=(-(y(29)*params(1)));
g1(4,14)=(-y(10));
g1(5,8)=1+y(13);
g1(5,28)=(-(params(1)*(1+y(30))+y(14)));
g1(5,13)=y(8);
g1(5,30)=params(6)*params(1)-params(1)*(y(28)+params(6)+params(5));
g1(5,14)=(-y(28));
g1(6,8)=1;
g1(6,28)=(-params(2));
g1(6,15)=(-(params(2)*params(4)*getPowerDeriv(params(7)+y(15),params(4)-1,1)));
g1(7,29)=(-((1-params(8))*params(3)));
g1(7,31)=(-(params(8)*params(3)*y(32)));
g1(7,17)=1;
g1(7,32)=(-(params(8)*params(3)*y(31)));
g1(8,18)=1;
g1(8,33)=(-(params(8)*params(3)*y(34)));
g1(8,34)=(-(params(8)*params(3)*y(33)));
g1(9,17)=(-(y(18)/((params(10)-y(17))*(params(10)-y(17)))));
g1(9,18)=(-(1/(params(10)-y(17))));
g1(9,21)=1;
g1(10,11)=1;
g1(10,20)=(-(y(21)*(1+y(27))));
g1(10,21)=(-(y(20)*(1+y(27))));
g1(10,27)=(-(y(21)*y(20)));
g1(11,1)=(-params(17));
g1(11,3)=(-params(19));
g1(11,5)=(-params(18));
g1(11,27)=1;
g1(12,29)=(-y(21));
g1(12,19)=1;
g1(12,21)=(-(y(29)-T(1)));
g1(13,16)=1;
g1(13,19)=(-(y(21)/y(6)));
g1(13,6)=(-(y(19)*(-y(21))/(y(6)*y(6))));
g1(13,21)=(-(y(19)*1/y(6)));
g1(14,20)=1;
g1(14,22)=(-1);
g1(14,23)=(-1);
g1(15,10)=(-((1-x(it_, 1))*y(5)*params(8)*y(6)));
g1(15,5)=(-(params(8)*(T(1)+y(6)*(y(10)-T(1)))*(1-x(it_, 1))));
g1(15,6)=(-((1-x(it_, 1))*y(5)*params(8)*(y(10)-T(1))));
g1(15,22)=1;
g1(15,35)=y(5)*params(8)*(T(1)+y(6)*(y(10)-T(1)));
g1(16,3)=(-params(9));
g1(16,23)=1;
g1(17,10)=y(3);
g1(17,3)=y(10)-params(11)*(1-params(8)-params(9));
g1(17,12)=1;
g1(17,24)=params(11);
g1(17,7)=params(11)/params(2);
g1(17,26)=(-1);
g1(18,2)=(-(params(6)+params(5)));
g1(18,4)=(-(params(11)*getPowerDeriv(params(7)+y(4),params(4),1)));
g1(18,26)=1;
g1(19,9)=1;
g1(19,15)=params(11);
g1(20,11)=1;
g1(20,20)=(-1);
g1(20,25)=params(11);

end
