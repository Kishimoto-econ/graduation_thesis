#include <math.h>
#include "mex.h"

// The k-th derivative of x^p
inline double
getPowerDeriv(double x, double p, int k)
{
  if (fabs(x) < 1e-12 && p >= 0 && k > p && fabs(p-nearbyint(p)) < 1e-12)
    return 0.0;
  else
    {
      double dxp = pow(x, p-k);
      for (int i = 0; i<k; i++)
        dxp *= p--;
      return dxp;
    }
}
extern inline double getPowerDeriv(double x, double p, int k);

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  if (nrhs != 8)
    mexErrMsgTxt("Accepts exactly 8 input arguments");
  if (nlhs < 2 || nlhs > 4)
    mexErrMsgTxt("Accepts 2 to 4 output arguments");
  if (!(mxIsDouble(prhs[0]) && !mxIsComplex(prhs[0]) && !mxIsSparse(prhs[0]) && mxGetNumberOfElements(prhs[0]) == 66))
    mexErrMsgTxt("y must be a real dense numeric array with 66 elements");
  if (!(mxIsDouble(prhs[1]) && !mxIsComplex(prhs[1]) && !mxIsSparse(prhs[1]) && mxGetNumberOfElements(prhs[1]) == 2))
    mexErrMsgTxt("x must be a real dense numeric array with 2 elements");
  const double *restrict x = mxGetPr(prhs[1]);
  if (!(mxIsDouble(prhs[2]) && !mxIsComplex(prhs[2]) && !mxIsSparse(prhs[2]) && mxGetNumberOfElements(prhs[2]) == 38))
    mexErrMsgTxt("params must be a real dense numeric array with 38 elements");
  const double *restrict params = mxGetPr(prhs[2]);
  if (!(mxIsDouble(prhs[3]) && !mxIsComplex(prhs[3]) && !mxIsSparse(prhs[3]) && mxGetNumberOfElements(prhs[3]) == 22))
    mexErrMsgTxt("steady_state must be a real dense numeric array with 22 elements");
  const double *restrict steady_state = mxGetPr(prhs[3]);
  plhs[0] = mxDuplicateArray(prhs[0]);
  double *restrict y = mxGetPr(plhs[0]);
  if (!(mxIsInt32(prhs[4]) && mxGetNumberOfElements(prhs[4]) == 1))
    mexErrMsgTxt("sparse_rowval must be an int32 array with 1 elements");
  if (!(mxIsInt32(prhs[6]) && mxGetNumberOfElements(prhs[6]) == 2))
    mexErrMsgTxt("sparse_colptr must be an int32 array with 2 elements");
#if MX_HAS_INTERLEAVED_COMPLEX
  const int32_T *restrict sparse_rowval = mxGetInt32s(prhs[4]);
  const int32_T *restrict sparse_colptr = mxGetInt32s(prhs[6]);
#else
  const int32_T *restrict sparse_rowval = (int32_T *) mxGetData(prhs[4]);
  const int32_T *restrict sparse_colptr = (int32_T *) mxGetData(prhs[6]);
#endif
  if (!(mxIsDouble(prhs[7]) && !mxIsComplex(prhs[7]) && !mxIsSparse(prhs[7]) && mxGetNumberOfElements(prhs[7]) >= 0))
    mexErrMsgTxt("T must be a real dense numeric array with at least 0 elements");
  plhs[1] = mxDuplicateArray(prhs[7]);
  double *restrict T = mxGetPr(plhs[1]);
  mxArray *residual_mx = mxCreateDoubleMatrix(1, 1, mxREAL);
  double *restrict residual = mxGetPr(residual_mx);
  if (nlhs > 2)
    plhs[2] = residual_mx;
  residual[0]=(y[25]+params[10]*y[39])-(y[34]);
  if (nlhs > 3)
    {
  plhs[3] = mxCreateSparse(1, 1, 1, mxREAL);
  mwIndex *restrict ir = mxGetIr(plhs[3]), *restrict jc = mxGetJc(plhs[3]);
  for (mwSize i = 0; i < 1; i++)
    *ir++ = *sparse_rowval++ - 1;
  for (mwSize i = 0; i < 2; i++)
    *jc++ = *sparse_colptr++ - 1;
      double *restrict g1_v = mxGetPr(plhs[3]);
g1_v[0]=params[10];
    }
}
