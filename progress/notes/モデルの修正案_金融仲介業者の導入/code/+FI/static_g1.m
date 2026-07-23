function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = FI.static_g1_tt(T, y, x, params);
end
g1 = zeros(20, 20);
g1(1,2)=(-params(6))-params(5);
g1(1,3)=y(4);
g1(1,4)=y(3)-1;
g1(1,5)=1;
g1(2,1)=(-y(2));
g1(2,2)=(-y(1));
g1(2,3)=y(4);
g1(2,4)=y(3);
g1(3,2)=(-params(6));
g1(3,5)=1;
g1(4,3)=(-((1+y(6))*params(1)+y(7)));
g1(4,6)=1-y(3)*params(1);
g1(4,7)=(-y(3));
g1(5,1)=1+y(6)-((1+y(6))*params(1)+y(7));
g1(5,6)=y(1)+params(6)*params(1)-params(1)*(y(1)+params(6)+params(5));
g1(5,7)=(-y(1));
g1(6,1)=1-params(2);
g1(6,8)=(-(params(2)*params(4)*getPowerDeriv(params(7)+y(8),params(4)-1,1)));
g1(7,3)=(-((1-params(8))*params(3)));
g1(7,9)=(-(y(10)*params(8)*params(3)));
g1(7,10)=1-params(8)*params(3)*y(9);
g1(8,11)=1-params(8)*params(3)*y(12);
g1(8,12)=(-(params(8)*params(3)*y(11)));
g1(9,10)=(-(y(11)/((params(10)-y(10))*(params(10)-y(10)))));
g1(9,11)=(-(1/(params(10)-y(10))));
g1(9,14)=1;
g1(10,4)=1;
g1(10,13)=(-(y(14)*(1+y(20))));
g1(10,14)=(-(y(13)*(1+y(20))));
g1(10,20)=(-(y(14)*y(13)));
g1(11,1)=(-params(17));
g1(11,4)=(-params(19));
g1(11,13)=(-params(18));
g1(11,20)=1;
g1(12,3)=(-y(14));
g1(12,12)=1;
g1(12,14)=(-T(1));
g1(13,9)=1;
g1(13,12)=(-1);
g1(14,13)=1;
g1(14,15)=(-1);
g1(14,16)=(-1);
g1(15,3)=(-((1-x(1))*y(13)*params(8)*y(14)));
g1(15,13)=(-(params(8)*T(2)*(1-x(1))));
g1(15,14)=(-((1-x(1))*y(13)*params(8)*T(1)));
g1(15,15)=1;
g1(16,4)=(-params(9));
g1(16,16)=1;
g1(17,3)=y(4);
g1(17,4)=y(3)-params(11)*(1-params(8)-params(9));
g1(17,5)=1;
g1(17,17)=params(11);
g1(17,18)=params(11)/params(2);
g1(17,19)=(-1);
g1(18,2)=(-(params(6)+params(5)));
g1(18,8)=(-(params(11)*getPowerDeriv(params(7)+y(8),params(4),1)));
g1(18,19)=1;
g1(19,2)=1;
g1(19,8)=params(11);
g1(20,4)=1;
g1(20,13)=(-1);
g1(20,18)=params(11);

end
