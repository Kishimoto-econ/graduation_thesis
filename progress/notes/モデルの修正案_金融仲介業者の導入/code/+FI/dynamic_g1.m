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
    T = FI.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 34);
g1(1,7)=y(8)-y(1);
g1(1,1)=(-y(7))-params(6)-params(5);
g1(1,8)=y(7);
g1(1,2)=y(3);
g1(1,3)=y(2);
g1(1,10)=(-1);
g1(1,11)=1;
g1(2,26)=(-y(8));
g1(2,8)=(-y(26));
g1(2,9)=y(10);
g1(2,10)=y(9);
g1(3,1)=(-params(6));
g1(3,11)=1;
g1(4,9)=(-(params(1)*(1+y(28))+y(13)));
g1(4,12)=1;
g1(4,28)=(-(y(9)*params(1)));
g1(4,13)=(-y(9));
g1(5,7)=1+y(12);
g1(5,26)=(-(params(1)*(1+y(28))+y(13)));
g1(5,12)=y(7);
g1(5,28)=params(6)*params(1)-params(1)*(y(26)+params(6)+params(5));
g1(5,13)=(-y(26));
g1(6,7)=1;
g1(6,26)=(-params(2));
g1(6,14)=(-(params(2)*params(4)*getPowerDeriv(params(7)+y(14),params(4)-1,1)));
g1(7,27)=(-((1-params(8))*params(3)));
g1(7,29)=(-(params(8)*params(3)*y(30)));
g1(7,16)=1;
g1(7,30)=(-(params(8)*params(3)*y(29)));
g1(8,17)=1;
g1(8,31)=(-(params(8)*params(3)*y(32)));
g1(8,32)=(-(params(8)*params(3)*y(31)));
g1(9,16)=(-(y(17)/((params(10)-y(16))*(params(10)-y(16)))));
g1(9,17)=(-(1/(params(10)-y(16))));
g1(9,20)=1;
g1(10,10)=1;
g1(10,19)=(-(y(20)*(1+y(25))));
g1(10,20)=(-(y(19)*(1+y(25))));
g1(10,25)=(-(y(20)*y(19)));
g1(11,7)=(-params(17));
g1(11,10)=(-params(19));
g1(11,19)=(-params(18));
g1(11,25)=1;
g1(12,27)=(-y(20));
g1(12,18)=1;
g1(12,20)=(-(y(27)-T(1)));
g1(13,15)=1;
g1(13,18)=(-(y(20)/y(5)));
g1(13,5)=(-(y(18)*(-y(20))/(y(5)*y(5))));
g1(13,20)=(-(y(18)*1/y(5)));
g1(14,19)=1;
g1(14,21)=(-1);
g1(14,22)=(-1);
g1(15,9)=(-((1-x(it_, 1))*y(4)*params(8)*y(5)));
g1(15,4)=(-(params(8)*(T(1)+y(5)*(y(9)-T(1)))*(1-x(it_, 1))));
g1(15,5)=(-((1-x(it_, 1))*y(4)*params(8)*(y(9)-T(1))));
g1(15,21)=1;
g1(15,34)=params(8)*(T(1)+y(5)*(y(9)-T(1)))*y(4);
g1(16,3)=(-params(9));
g1(16,22)=1;
g1(17,2)=y(3);
g1(17,3)=y(2)-params(11)*(1-params(8)-params(9));
g1(17,11)=1;
g1(17,23)=params(11);
g1(17,6)=params(11)/params(2);
g1(17,24)=(-1);
g1(18,1)=(-(params(6)+params(5)));
g1(18,14)=(-(params(11)*getPowerDeriv(params(7)+y(14),params(4),1)));
g1(18,24)=1;
g1(19,8)=1;
g1(19,14)=params(11);
g1(20,10)=1;
g1(20,19)=(-1);
g1(20,33)=params(11);

end
