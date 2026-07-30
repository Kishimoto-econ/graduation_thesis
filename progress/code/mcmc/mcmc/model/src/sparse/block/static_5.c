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
  if (nrhs != 7)
    mexErrMsgTxt("Accepts exactly 7 input arguments");
  if (nlhs != 2)
    mexErrMsgTxt("Accepts exactly 2 output arguments");
  if (!(mxIsDouble(prhs[0]) && !mxIsComplex(prhs[0]) && !mxIsSparse(prhs[0]) && mxGetNumberOfElements(prhs[0]) == 22))
    mexErrMsgTxt("y must be a real dense numeric array with 22 elements");
  if (!(mxIsDouble(prhs[1]) && !mxIsComplex(prhs[1]) && !mxIsSparse(prhs[1]) && mxGetNumberOfElements(prhs[1]) == 2))
    mexErrMsgTxt("x must be a real dense numeric array with 2 elements");
  const double *restrict x = mxGetPr(prhs[1]);
  if (!(mxIsDouble(prhs[2]) && !mxIsComplex(prhs[2]) && !mxIsSparse(prhs[2]) && mxGetNumberOfElements(prhs[2]) == 38))
    mexErrMsgTxt("params must be a real dense numeric array with 38 elements");
  const double *restrict params = mxGetPr(prhs[2]);
  plhs[0] = mxDuplicateArray(prhs[0]);
  double *restrict y = mxGetPr(plhs[0]);
  if (!(mxIsDouble(prhs[6]) && !mxIsComplex(prhs[6]) && !mxIsSparse(prhs[6]) && mxGetNumberOfElements(prhs[6]) >= 0))
    mexErrMsgTxt("T must be a real dense numeric array with at least 0 elements");
  plhs[1] = mxDuplicateArray(prhs[6]);
  double *restrict T = mxGetPr(plhs[1]);
  y[18]=y[1]*(params[4]+params[5])*(1-x[1])+(1-x[1])*params[10]*pow(params[6]+y[7],params[3]);
}
