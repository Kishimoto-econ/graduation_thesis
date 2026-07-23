function [y, T] = dynamic_4(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(19)=y(16)+params(2)*y(17);
  y(20)=y(19);
end
