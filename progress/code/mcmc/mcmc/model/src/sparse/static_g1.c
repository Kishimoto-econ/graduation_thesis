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

void static_g1(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict T, double *restrict g1_v)
{
g1_v[0]=(-y[1]);
g1_v[1]=1+y[5]-((1+y[5])*params[0]+y[6]);
g1_v[2]=1-params[1];
g1_v[3]=(-params[16]);
g1_v[4]=(-((params[4]+params[5])*(1-y[21])));
g1_v[5]=(-y[0]);
g1_v[6]=(-params[5]);
g1_v[7]=(-((params[4]+params[5])*(1-x[1])));
g1_v[8]=1;
g1_v[9]=y[3];
g1_v[10]=y[3];
g1_v[11]=(-((1+y[5])*params[0]+y[6]));
g1_v[12]=(-((1-params[7])*params[2]));
g1_v[13]=(-y[13]);
g1_v[14]=(-((1-x[0])*y[12]*params[7]*y[13]));
g1_v[15]=y[3];
g1_v[16]=y[2]-1;
g1_v[17]=y[2];
g1_v[18]=1;
g1_v[19]=(-params[18]);
g1_v[20]=(-params[8]);
g1_v[21]=y[2]-params[10]*(1-params[7]-params[8]);
g1_v[22]=1;
g1_v[23]=1;
g1_v[24]=1;
g1_v[25]=1;
g1_v[26]=1-y[2]*params[0];
g1_v[27]=y[0]+params[5]*params[0]-params[0]*(y[0]+(params[4]+params[5])*(1-x[1]));
g1_v[28]=(-y[2]);
g1_v[29]=(-y[0]);
g1_v[30]=(-(params[1]*(1-y[21])*params[3]*T[1]));
g1_v[31]=(-((1-x[1])*params[10]*getPowerDeriv(params[6]+y[7],params[3],1)));
g1_v[32]=params[10];
g1_v[33]=(-(y[9]*params[7]*params[2]));
g1_v[34]=1;
g1_v[35]=1-params[7]*params[2]*y[8];
g1_v[36]=(-(y[10]/((params[9]-y[9])*(params[9]-y[9]))));
g1_v[37]=1-params[7]*params[2]*y[11];
g1_v[38]=(-(1/(params[9]-y[9])));
g1_v[39]=(-(params[7]*params[2]*y[10]));
g1_v[40]=1;
g1_v[41]=(-1);
g1_v[42]=(-(y[13]*(1+y[19])));
g1_v[43]=(-params[17]);
g1_v[44]=1;
g1_v[45]=(-(params[7]*(1/params[1]+(y[2]-1/params[1])*y[13])*(1-x[0])));
g1_v[46]=(-1);
g1_v[47]=1;
g1_v[48]=(-(y[12]*(1+y[19])));
g1_v[49]=(-(y[2]-1/params[1]));
g1_v[50]=(-((1-x[0])*y[12]*params[7]*(y[2]-1/params[1])));
g1_v[51]=(-1);
g1_v[52]=1;
g1_v[53]=(-1);
g1_v[54]=1;
g1_v[55]=params[10];
g1_v[56]=params[10]/params[1];
g1_v[57]=params[10];
g1_v[58]=(-1);
g1_v[59]=1;
g1_v[60]=(-(y[13]*y[12]));
g1_v[61]=1;
g1_v[62]=1;
g1_v[63]=(-(y[1]*(-(params[4]+params[5]))));
g1_v[64]=(-(params[1]*T[0]*(-params[3])));
g1_v[65]=1;
}

