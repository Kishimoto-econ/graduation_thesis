function [y, T] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(19)=y(2)*(params(6)+params(5))+params(11)*(params(7)+y(8))^params(4);
end
