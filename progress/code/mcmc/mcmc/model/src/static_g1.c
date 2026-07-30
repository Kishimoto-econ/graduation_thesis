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

void static_g1(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict T, double *restrict g1)
{
g1[440]=1;
g1[23]=(-((params[4]+params[5])*(1-y[21])));
g1[45]=y[3];
g1[67]=y[2]-1;
g1[89]=1;
g1[463]=(-(y[1]*(-(params[4]+params[5]))));
g1[2]=(-y[1]);
g1[24]=(-y[0]);
g1[46]=y[3];
g1[68]=y[2];
g1[25]=(-params[5]);
g1[91]=1;
g1[48]=(-((1+y[5])*params[0]+y[6]));
g1[114]=1-y[2]*params[0];
g1[136]=(-y[2]);
g1[5]=1+y[5]-((1+y[5])*params[0]+y[6]);
g1[115]=y[0]+params[5]*params[0]-params[0]*(y[0]+(params[4]+params[5])*(1-x[1]));
g1[137]=(-y[0]);
g1[6]=1-params[1];
g1[160]=(-(params[1]*(1-y[21])*params[3]*T[1]));
g1[468]=(-(params[1]*T[0]*(-params[3])));
g1[51]=(-((1-params[7])*params[2]));
g1[183]=(-(y[9]*params[7]*params[2]));
g1[205]=1-params[7]*params[2]*y[8];
g1[228]=1-params[7]*params[2]*y[11];
g1[250]=(-(params[7]*params[2]*y[10]));
g1[207]=(-(y[10]/((params[9]-y[9])*(params[9]-y[9]))));
g1[229]=(-(1/(params[9]-y[9])));
g1[295]=1;
g1[76]=1;
g1[274]=(-(y[13]*(1+y[19])));
g1[296]=(-(y[12]*(1+y[19])));
g1[428]=(-(y[13]*y[12]));
g1[11]=(-params[16]);
g1[77]=(-params[18]);
g1[275]=(-params[17]);
g1[429]=1;
g1[56]=(-y[13]);
g1[254]=1;
g1[298]=(-(y[2]-1/params[1]));
g1[189]=1;
g1[255]=(-1);
g1[278]=1;
g1[322]=(-1);
g1[344]=(-1);
g1[59]=(-((1-x[0])*y[12]*params[7]*y[13]));
g1[279]=(-(params[7]*(1/params[1]+(y[2]-1/params[1])*y[13])*(1-x[0])));
g1[301]=(-((1-x[0])*y[12]*params[7]*(y[2]-1/params[1])));
g1[323]=1;
g1[82]=(-params[8]);
g1[346]=1;
g1[61]=y[3];
g1[83]=y[2]-params[10]*(1-params[7]-params[8]);
g1[105]=1;
g1[369]=params[10];
g1[391]=params[10]/params[1];
g1[413]=(-1);
g1[40]=(-((params[4]+params[5])*(1-x[1])));
g1[172]=(-((1-x[1])*params[10]*getPowerDeriv(params[6]+y[7],params[3],1)));
g1[414]=1;
g1[41]=1;
g1[173]=params[10];
g1[86]=1;
g1[284]=(-1);
g1[394]=params[10];
g1[483]=1;
}

