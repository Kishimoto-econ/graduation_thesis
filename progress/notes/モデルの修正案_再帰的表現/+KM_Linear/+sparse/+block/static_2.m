function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(2))-(y(2)*params(5)/params(4)+1/params(4)*y(8));
  residual(2)=(y(1)*params(12)*(1+params(16))+params(12)*y(2)+y(2)*params(7)*params(5))-(y(1)*params(12)*(params(5)*(1+params(16))+params(15))+y(2)*params(5)*(params(12)+params(6)+params(7))+y(8)*params(12)*params(15)-x(1)*params(12)*params(15));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-(1/params(4)));
g1_v(2)=(-(params(12)*params(15)));
g1_v(3)=1-params(5)/params(4);
g1_v(4)=params(12)+params(7)*params(5)-params(5)*(params(12)+params(6)+params(7));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
