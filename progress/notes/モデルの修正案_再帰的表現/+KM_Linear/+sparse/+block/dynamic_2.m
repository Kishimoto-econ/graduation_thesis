function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(12))-(params(5)/params(4)*y(22)+1/params(4)*y(18));
  residual(2)=(params(12)*(1+params(16))*y(11)+params(12)*y(12)+y(22)*params(7)*params(5))-(y(21)*params(12)*(params(5)*(1+params(16))+params(15))+y(22)*params(5)*(params(12)+params(6)+params(7))+y(18)*params(12)*params(15)-x(1)*params(12)*params(15));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-(1/params(4)));
g1_v(2)=(-(params(12)*params(15)));
g1_v(3)=1;
g1_v(4)=params(12);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
