function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(params(13)*y(6)+params(2)*params(14)*y(7))-(y(3)*params(9)*(params(6)+params(7))+y(4)*params(10)*params(1)*params(2)*(params(10)+params(8))^(params(1)-1));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=params(2)*params(14);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
