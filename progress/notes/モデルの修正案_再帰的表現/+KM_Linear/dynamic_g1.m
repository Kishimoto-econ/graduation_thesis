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
    T = KM_Linear.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 16);
g1(1,1)=(-(params(12)*params(9)+params(9)*(params(6)+params(7))));
g1(1,6)=params(12)*params(9);
g1(1,3)=params(11)/params(4);
g1(1,8)=(-params(11));
g1(1,9)=params(13);
g1(2,14)=(-1);
g1(2,6)=(-1);
g1(2,8)=1;
g1(2,16)=1;
g1(3,1)=(-1);
g1(3,9)=1;
g1(4,5)=1;
g1(4,15)=(-(params(5)/params(4)));
g1(4,11)=(-(1/params(4)));
g1(5,4)=params(12)*(1+params(16));
g1(5,14)=(-(params(12)*(params(5)*(1+params(16))+params(15))));
g1(5,5)=params(12);
g1(5,15)=params(7)*params(5)-params(5)*(params(12)+params(6)+params(7));
g1(5,11)=(-(params(12)*params(15)));
g1(5,16)=params(12)*params(15);
g1(6,4)=params(12);
g1(6,14)=(-(params(12)*params(4)));
g1(6,7)=(-T(1));
g1(7,1)=(-(params(9)*(params(6)+params(7))));
g1(7,2)=(-T(2));
g1(7,9)=params(13);
g1(7,10)=params(2)*params(14);
g1(8,6)=params(9);
g1(8,7)=params(10)*params(2);
g1(9,9)=(-1);
g1(9,10)=(-params(2));
g1(9,12)=1;
g1(10,12)=(-1);
g1(10,13)=1;

end
