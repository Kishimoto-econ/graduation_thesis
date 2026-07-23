function [y, T, residual, g1] = static_1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(params(12)*params(9)*y(3)+params(11)/params(4)*y(5)+params(13)*y(6))-(y(3)*(params(12)*params(9)+params(9)*(params(6)+params(7)))+params(11)*y(5));
  residual(2)=(y(5))-(y(3)+y(1)-x(1));
  residual(3)=(y(6))-(y(3));
  T(1)=params(10)*params(4)*params(1)*(params(1)-1)*(params(10)+params(8))^(params(1)-2);
  residual(4)=(params(12)*y(1))-(T(1)*y(4)+y(1)*params(12)*params(4));
  residual(5)=(params(9)*y(3)+y(4)*params(10)*params(2))-(0);
if nargout > 3
    g1_v = NaN(12, 1);
g1_v(1)=params(11)/params(4)-params(11);
g1_v(2)=1;
g1_v(3)=params(12)*params(9)-(params(12)*params(9)+params(9)*(params(6)+params(7)));
g1_v(4)=(-1);
g1_v(5)=(-1);
g1_v(6)=params(9);
g1_v(7)=params(13);
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=params(12)-params(12)*params(4);
g1_v(11)=(-T(1));
g1_v(12)=params(10)*params(2);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
