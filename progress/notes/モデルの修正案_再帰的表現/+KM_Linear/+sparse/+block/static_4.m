function [y, T] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(9)=y(6)+params(2)*y(7);
  y(10)=y(9);
end
