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
  if (nlhs != 2)
    mexErrMsgTxt("Accepts exactly 2 output arguments");
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
  if (!(mxIsDouble(prhs[7]) && !mxIsComplex(prhs[7]) && !mxIsSparse(prhs[7]) && mxGetNumberOfElements(prhs[7]) >= 0))
    mexErrMsgTxt("T must be a real dense numeric array with at least 0 elements");
  plhs[1] = mxDuplicateArray(prhs[7]);
  double *restrict T = mxGetPr(plhs[1]);
  y[40]=y[1]*(params[4]+params[5])*(1-x[1])+(1-x[1])*params[10]*pow(params[6]+y[7],params[3]);
  y[42]=log(y[40])-log(y[18]);
}
