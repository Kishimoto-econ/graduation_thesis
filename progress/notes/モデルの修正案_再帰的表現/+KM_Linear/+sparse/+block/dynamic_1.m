function [y, T, residual, g1] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(16))-(y(3));
  residual(2)=(params(9)*y(13)+y(14)*params(10)*params(2))-(0);
  residual(3)=(params(12)*params(9)*y(13)+params(11)/params(4)*y(5)+params(13)*y(16))-((params(12)*params(9)+params(9)*(params(6)+params(7)))*y(3)+params(11)*y(15));
  residual(4)=(y(15))-(y(13)+y(21)-x(1));
  T(1)=params(10)*params(4)*params(1)*(params(1)-1)*(params(8)+params(10))^(params(1)-2);
  residual(5)=(params(12)*y(11))-(T(1)*y(14)+y(21)*params(12)*params(4));
if nargout > 3
    g1_v = NaN(15, 1);
g1_v(1)=(-1);
g1_v(2)=(-(params(12)*params(9)+params(9)*(params(6)+params(7))));
g1_v(3)=params(11)/params(4);
g1_v(4)=1;
g1_v(5)=params(13);
g1_v(6)=params(10)*params(2);
g1_v(7)=(-T(1));
g1_v(8)=params(9);
g1_v(9)=params(12)*params(9);
g1_v(10)=(-1);
g1_v(11)=(-params(11));
g1_v(12)=1;
g1_v(13)=params(12);
g1_v(14)=(-1);
g1_v(15)=(-(params(12)*params(4)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
