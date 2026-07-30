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

void dynamic_resid(const double *restrict y, const double *restrict x, int nb_row_x, const double *restrict params, const double *restrict steady_state, int it_, const double *restrict T, double *restrict residual)
{
    residual[0] = (y[28]) - (log(y[26])-log(y[7]));
    residual[1] = (y[8]*(y[9]-y[1])+y[10]*y[2]+y[12]) - (y[11]+y[1]*(params[4]+params[5])*(1-y[37]));
    residual[2] = (y[11]*y[31]) - (y[9]*y[30]);
    residual[3] = (y[12]) - (y[1]*params[5]);
    residual[4] = (1+y[13]) - (y[31]*params[0]*(1+y[32])+y[10]*y[14]);
    residual[5] = (y[8]*(1+y[13])+y[32]*params[5]*params[0]) - (params[0]*(1+y[32])*(y[30]+(params[4]+params[5])*(1-x[it_+1*nb_row_x]))+y[30]*y[14]);
    residual[6] = (y[8]) - (params[1]*(y[30]+T[0]*params[3]*(1-y[37])));
    residual[7] = (y[17]) - ((1-params[7])*params[2]*(y[31]-1/params[1])+params[7]*params[2]*y[33]*y[34]);
    residual[8] = (y[18]) - (1-params[7]+params[7]*params[2]*y[36]*y[35]);
    residual[9] = (y[21]) - (y[18]/(params[9]-y[17]));
    residual[10] = (y[11]) - (y[21]*y[20]*(1+y[27]));
    residual[11] = (y[27]) - (params[16]*(y[0]-params[19])+params[17]*(y[4]-params[34])+params[18]*(y[2]-params[22]));
    residual[12] = (y[19]) - (1/params[1]+(y[31]-1/params[1])*y[21]);
    residual[13] = (y[16]) - (y[19]*y[21]/y[5]);
    residual[14] = (y[20]) - (y[22]+y[23]);
    residual[15] = (y[22]) - (y[4]*params[7]*(1/params[1]+y[5]*(y[10]-1/params[1]))*(1-x[it_+0*nb_row_x]));
    residual[16] = (y[23]) - (y[2]*params[8]);
    residual[17] = (y[10]*y[2]+y[12]+params[10]*y[24]+params[10]*y[6]/params[1]) - (y[26]+y[2]*params[10]*(1-params[7]-params[8]));
    residual[18] = (y[26]) - (y[1]*(params[4]+params[5])*(1-x[it_+1*nb_row_x])+(1-x[it_+1*nb_row_x])*params[10]*T[1]);
    residual[19] = (y[9]+y[15]*params[10]) - (params[11]);
    residual[20] = (y[11]+params[10]*y[25]) - (y[20]);
    residual[21] = (y[29]) - (x[it_+1*nb_row_x]);
}

