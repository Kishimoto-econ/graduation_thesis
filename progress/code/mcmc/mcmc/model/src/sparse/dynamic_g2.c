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

void dynamic_g2(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict steady_state, const double *restrict T, double *restrict g2_v)
{
g2_v[0]=(-1)/(y[18]*y[18]);
g2_v[1]=(-((-1)/(y[40]*y[40])));
g2_v[2]=(-1);
g2_v[3]=1;
g2_v[4]=params[4]+params[5];
g2_v[5]=1;
g2_v[6]=(-1);
g2_v[7]=1;
g2_v[8]=(-1);
g2_v[9]=(-params[0]);
g2_v[10]=1;
g2_v[11]=(-params[0]);
g2_v[12]=(-1);
g2_v[13]=(-(params[0]*(-(params[4]+params[5]))));
g2_v[14]=(-(params[1]*params[3]*(1-y[65])*getPowerDeriv(params[6]+y[29],params[3]-1,2)));
g2_v[15]=(-(params[1]*T[3]*(-params[3])));
g2_v[16]=(-(params[7]*params[2]));
g2_v[17]=(-(params[7]*params[2]));
g2_v[18]=(-((-(y[32]*((-(params[9]-y[31]))-(params[9]-y[31]))))/((params[9]-y[31])*(params[9]-y[31])*(params[9]-y[31])*(params[9]-y[31]))));
g2_v[19]=(-(1/((params[9]-y[31])*(params[9]-y[31]))));
g2_v[20]=(-(1+y[41]));
g2_v[21]=(-y[35]);
g2_v[22]=(-y[34]);
g2_v[23]=(-1);
g2_v[24]=(-((-y[35])/(y[13]*y[13])));
g2_v[25]=(-(1/y[13]));
g2_v[26]=(-(y[33]*(-((-y[35])*(y[13]+y[13])))/(y[13]*y[13]*y[13]*y[13])));
g2_v[27]=(-(y[33]*(-1)/(y[13]*y[13])));
g2_v[28]=(-((1-x[0])*params[7]*y[13]));
g2_v[29]=(-((1-x[0])*params[7]*y[12]));
g2_v[30]=y[12]*params[7]*y[13];
g2_v[31]=(-((1-x[0])*params[7]*(y[24]-1/params[1])));
g2_v[32]=params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]));
g2_v[33]=y[12]*params[7]*(y[24]-1/params[1]);
g2_v[34]=1;
g2_v[35]=params[4]+params[5];
g2_v[36]=(-((1-x[1])*params[10]*getPowerDeriv(params[6]+y[7],params[3],2)));
g2_v[37]=(-(T[2]*(-params[10])));
}

