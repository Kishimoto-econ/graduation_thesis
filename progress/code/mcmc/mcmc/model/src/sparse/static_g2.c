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

void static_g2(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict T, double *restrict g2_v)
{
g2_v[0]=params[4]+params[5];
g2_v[1]=1;
g2_v[2]=(-1);
g2_v[3]=1;
g2_v[4]=(-params[0]);
g2_v[5]=(-1);
g2_v[6]=1-params[0];
g2_v[7]=(-1);
g2_v[8]=(-(params[1]*(1-y[21])*params[3]*getPowerDeriv(params[6]+y[7],params[3]-1,2)));
g2_v[9]=(-(params[1]*T[1]*(-params[3])));
g2_v[10]=(-(params[7]*params[2]));
g2_v[11]=(-(params[7]*params[2]));
g2_v[12]=(-((-(y[10]*((-(params[9]-y[9]))-(params[9]-y[9]))))/((params[9]-y[9])*(params[9]-y[9])*(params[9]-y[9])*(params[9]-y[9]))));
g2_v[13]=(-(1/((params[9]-y[9])*(params[9]-y[9]))));
g2_v[14]=(-(1+y[19]));
g2_v[15]=(-y[13]);
g2_v[16]=(-y[12]);
g2_v[17]=(-1);
g2_v[18]=(-((1-x[0])*params[7]*y[13]));
g2_v[19]=(-((1-x[0])*params[7]*y[12]));
g2_v[20]=(-((1-x[0])*params[7]*(y[2]-1/params[1])));
g2_v[21]=1;
g2_v[22]=(-((1-x[1])*params[10]*getPowerDeriv(params[6]+y[7],params[3],2)));
}

