function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(1+y(6))-(y(3)*((1+y(6))*params(1)+y(7)));
  residual(2)=(y(1)*(1+y(6))+y(6)*params(6)*params(1))-((1+y(6))*params(1)*(y(1)+params(6)+params(5))+y(1)*y(7));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=1-y(3)*params(1);
g1_v(2)=y(1)+params(6)*params(1)-params(1)*(y(1)+params(6)+params(5));
g1_v(3)=(-y(3));
g1_v(4)=(-y(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
