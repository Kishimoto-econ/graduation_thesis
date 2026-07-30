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

void dynamic_g1(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict steady_state, const double *restrict T, double *restrict g1_v)
{
g1_v[0]=(-params[16]);
g1_v[1]=(-y[22])-(params[4]+params[5])*(1-y[65]);
g1_v[2]=(-params[5]);
g1_v[3]=(-((params[4]+params[5])*(1-x[1])));
g1_v[4]=y[24];
g1_v[5]=(-params[18]);
g1_v[6]=(-params[8]);
g1_v[7]=y[24]-params[10]*(1-params[7]-params[8]);
g1_v[8]=(-((1-x[1])*params[10]*T[2]));
g1_v[9]=(-params[17]);
g1_v[10]=(-(params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]))*(1-x[0])));
g1_v[11]=(-(y[33]*(-y[35])/(y[13]*y[13])));
g1_v[12]=(-((1-x[0])*y[12]*params[7]*(y[24]-1/params[1])));
g1_v[13]=params[10]/params[1];
g1_v[14]=1/y[18];
g1_v[15]=y[23]-y[1];
g1_v[16]=1+y[27];
g1_v[17]=1;
g1_v[18]=y[22];
g1_v[19]=(-y[44]);
g1_v[20]=1;
g1_v[21]=y[3];
g1_v[22]=(-y[28]);
g1_v[23]=(-((1-x[0])*y[12]*params[7]*y[13]));
g1_v[24]=y[3];
g1_v[25]=(-1);
g1_v[26]=y[46];
g1_v[27]=1;
g1_v[28]=1;
g1_v[29]=1;
g1_v[30]=1;
g1_v[31]=1;
g1_v[32]=1;
g1_v[33]=y[22];
g1_v[34]=(-y[24]);
g1_v[35]=(-y[44]);
g1_v[36]=(-(params[1]*params[3]*(1-y[65])*T[3]));
g1_v[37]=params[10];
g1_v[38]=1;
g1_v[39]=1;
g1_v[40]=(-(y[32]/((params[9]-y[31])*(params[9]-y[31]))));
g1_v[41]=1;
g1_v[42]=(-(1/(params[9]-y[31])));
g1_v[43]=1;
g1_v[44]=(-(y[35]/y[13]));
g1_v[45]=(-(y[35]*(1+y[41])));
g1_v[46]=1;
g1_v[47]=(-1);
g1_v[48]=1;
g1_v[49]=(-(y[34]*(1+y[41])));
g1_v[50]=(-(y[46]-1/params[1]));
g1_v[51]=(-(y[33]*1/y[13]));
g1_v[52]=(-1);
g1_v[53]=1;
g1_v[54]=(-1);
g1_v[55]=1;
g1_v[56]=params[10];
g1_v[57]=params[10];
g1_v[58]=(-(1/y[40]));
g1_v[59]=(-1);
g1_v[60]=1;
g1_v[61]=(-(y[35]*y[34]));
g1_v[62]=1;
g1_v[63]=1;
g1_v[64]=1;
g1_v[65]=(-y[23]);
g1_v[66]=(-(params[0]*(1+y[49])+y[28]));
g1_v[67]=(-params[1]);
g1_v[68]=y[25];
g1_v[69]=(-(params[0]*(1+y[49])));
g1_v[70]=(-((1-params[7])*params[2]));
g1_v[71]=(-y[35]);
g1_v[72]=(-(y[46]*params[0]));
g1_v[73]=params[5]*params[0]-params[0]*(y[44]+(params[4]+params[5])*(1-x[1]));
g1_v[74]=(-(params[7]*params[2]*y[53]));
g1_v[75]=(-(params[7]*params[2]*y[52]));
g1_v[76]=(-(params[7]*params[2]*y[55]));
g1_v[77]=(-(params[7]*params[2]*y[54]));
g1_v[78]=(-(y[1]*(-(params[4]+params[5]))));
g1_v[79]=(-(params[1]*T[0]*(-params[3])));
g1_v[80]=y[12]*params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]));
g1_v[81]=(-(params[0]*(1+y[49])*(-(params[4]+params[5]))));
g1_v[82]=(-(y[1]*(-(params[4]+params[5]))+T[1]*(-params[10])));
g1_v[83]=(-1);
}

