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

void static_resid(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict T, double *restrict residual)
{
residual[0] = y[20];
    residual[1] = (y[2]*y[3]+y[4]) - (y[3]+y[1]*(params[4]+params[5])*(1-y[21]));
    residual[2] = (y[2]*y[3]) - (y[0]*y[1]);
    residual[3] = (y[4]) - (y[1]*params[5]);
    residual[4] = (1+y[5]) - (y[2]*(1+y[5])*params[0]+y[2]*y[6]);
    residual[5] = (y[0]*(1+y[5])+y[5]*params[5]*params[0]) - ((1+y[5])*params[0]*(y[0]+(params[4]+params[5])*(1-x[1]))+y[0]*y[6]);
    residual[6] = (y[0]) - (params[1]*(y[0]+T[0]*(1-y[21])*params[3]));
    residual[7] = (y[9]) - ((1-params[7])*params[2]*(y[2]-1/params[1])+y[9]*params[7]*params[2]*y[8]);
    residual[8] = (y[10]) - (1-params[7]+y[10]*params[7]*params[2]*y[11]);
    residual[9] = (y[13]) - (y[10]/(params[9]-y[9]));
    residual[10] = (y[3]) - (y[13]*y[12]*(1+y[19]));
    residual[11] = (y[19]) - (params[16]*(y[0]-params[19])+params[17]*(y[12]-params[34])+params[18]*(y[3]-params[22]));
    residual[12] = (y[11]) - (1/params[1]+(y[2]-1/params[1])*y[13]);
    residual[13] = (y[8]) - (y[11]);
    residual[14] = (y[12]) - (y[14]+y[15]);
    residual[15] = (y[14]) - (y[12]*params[7]*(1/params[1]+(y[2]-1/params[1])*y[13])*(1-x[0]));
    residual[16] = (y[15]) - (y[3]*params[8]);
    residual[17] = (y[2]*y[3]+y[4]+params[10]*y[16]+params[10]*y[17]/params[1]) - (y[18]+y[3]*params[10]*(1-params[7]-params[8]));
    residual[18] = (y[18]) - (y[1]*(params[4]+params[5])*(1-x[1])+(1-x[1])*params[10]*pow(params[6]+y[7],params[3]));
    residual[19] = (y[1]+y[7]*params[10]) - (params[11]);
    residual[20] = (y[3]+params[10]*y[17]) - (y[12]);
    residual[21] = (y[21]) - (x[1]);
}

