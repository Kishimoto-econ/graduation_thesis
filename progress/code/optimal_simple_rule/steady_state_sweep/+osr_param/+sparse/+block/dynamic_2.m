function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(21)*(1+y(26))+y(46)*params(6)*params(1))-(params(1)*(1+y(46))*(y(41)+params(6)+params(5))+y(41)*y(27));
  residual(2)=(1+y(26))-(y(43)*params(1)*(1+y(46))+y(23)*y(27));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-y(41));
g1_v(2)=(-y(23));
g1_v(3)=y(21);
g1_v(4)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
