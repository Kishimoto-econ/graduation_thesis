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

void dynamic_resid(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict steady_state, const double *restrict T, double *restrict residual)
{
    residual[0] = (y[42]) - (log(y[40])-log(y[18]));
    residual[1] = (y[22]*(y[23]-y[1])+y[24]*y[3]+y[26]) - (y[25]+y[1]*(params[4]+params[5])*(1-y[65]));
    residual[2] = (y[25]*y[46]) - (y[23]*y[44]);
    residual[3] = (y[26]) - (y[1]*params[5]);
    residual[4] = (1+y[27]) - (y[46]*params[0]*(1+y[49])+y[24]*y[28]);
    residual[5] = (y[22]*(1+y[27])+y[49]*params[5]*params[0]) - (params[0]*(1+y[49])*(y[44]+(params[4]+params[5])*(1-x[1]))+y[44]*y[28]);
    residual[6] = (y[22]) - (params[1]*(y[44]+T[0]*params[3]*(1-y[65])));
    residual[7] = (y[31]) - ((1-params[7])*params[2]*(y[46]-1/params[1])+params[7]*params[2]*y[52]*y[53]);
    residual[8] = (y[32]) - (1-params[7]+params[7]*params[2]*y[55]*y[54]);
    residual[9] = (y[35]) - (y[32]/(params[9]-y[31]));
    residual[10] = (y[25]) - (y[35]*y[34]*(1+y[41]));
    residual[11] = (y[41]) - (params[16]*(y[0]-params[19])+params[17]*(y[12]-params[34])+params[18]*(y[3]-params[22]));
    residual[12] = (y[33]) - (1/params[1]+(y[46]-1/params[1])*y[35]);
    residual[13] = (y[30]) - (y[33]*y[35]/y[13]);
    residual[14] = (y[34]) - (y[36]+y[37]);
    residual[15] = (y[36]) - (y[12]*params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]))*(1-x[0]));
    residual[16] = (y[37]) - (y[3]*params[8]);
    residual[17] = (y[24]*y[3]+y[26]+params[10]*y[38]+params[10]*y[17]/params[1]) - (y[40]+y[3]*params[10]*(1-params[7]-params[8]));
    residual[18] = (y[40]) - (y[1]*(params[4]+params[5])*(1-x[1])+(1-x[1])*params[10]*T[1]);
    residual[19] = (y[23]+y[29]*params[10]) - (params[11]);
    residual[20] = (y[25]+params[10]*y[39]) - (y[34]);
    residual[21] = (y[43]) - (x[1]);
}

