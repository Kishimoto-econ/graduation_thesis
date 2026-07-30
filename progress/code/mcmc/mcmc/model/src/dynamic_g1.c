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

void dynamic_g1(const double *restrict y, const double *restrict x, int nb_row_x, const double *restrict params, const double *restrict steady_state, int it_, const double *restrict T, double *restrict g1)
{
g1[154]=1/y[7];
g1[572]=(-(1/y[26]));
g1[616]=1;
g1[177]=y[9]-y[1];
g1[23]=(-y[8])-(params[4]+params[5])*(1-y[37]);
g1[199]=y[8];
g1[221]=y[2];
g1[45]=y[10];
g1[243]=(-1);
g1[265]=1;
g1[815]=(-(y[1]*(-(params[4]+params[5]))));
g1[662]=(-y[9]);
g1[200]=(-y[30]);
g1[684]=y[11];
g1[244]=y[31];
g1[25]=(-params[5]);
g1[267]=1;
g1[224]=(-y[14]);
g1[686]=(-(params[0]*(1+y[32])));
g1[290]=1;
g1[708]=(-(y[31]*params[0]));
g1[312]=(-y[10]);
g1[181]=1+y[13];
g1[665]=(-(params[0]*(1+y[32])+y[14]));
g1[291]=y[8];
g1[709]=params[5]*params[0]-params[0]*(y[30]+(params[4]+params[5])*(1-x[it_+1*nb_row_x]));
g1[313]=(-y[30]);
g1[863]=(-(params[0]*(1+y[32])*(-(params[4]+params[5]))));
g1[182]=1;
g1[666]=(-params[1]);
g1[336]=(-(params[1]*params[3]*(1-y[37])*T[3]));
g1[820]=(-(params[1]*T[0]*(-params[3])));
g1[689]=(-((1-params[7])*params[2]));
g1[733]=(-(params[7]*params[2]*y[34]));
g1[381]=1;
g1[755]=(-(params[7]*params[2]*y[33]));
g1[404]=1;
g1[778]=(-(params[7]*params[2]*y[36]));
g1[800]=(-(params[7]*params[2]*y[35]));
g1[383]=(-(y[18]/((params[9]-y[17])*(params[9]-y[17]))));
g1[405]=(-(1/(params[9]-y[17])));
g1[471]=1;
g1[252]=1;
g1[450]=(-(y[21]*(1+y[27])));
g1[472]=(-(y[20]*(1+y[27])));
g1[604]=(-(y[21]*y[20]));
g1[11]=(-params[16]);
g1[55]=(-params[18]);
g1[99]=(-params[17]);
g1[605]=1;
g1[694]=(-y[21]);
g1[430]=1;
g1[474]=(-(y[31]-1/params[1]));
g1[365]=1;
g1[431]=(-(y[21]/y[5]));
g1[123]=(-(y[19]*(-y[21])/(y[5]*y[5])));
g1[475]=(-(y[19]*1/y[5]));
g1[454]=1;
g1[498]=(-1);
g1[520]=(-1);
g1[235]=(-((1-x[it_+0*nb_row_x])*y[4]*params[7]*y[5]));
g1[103]=(-(params[7]*(1/params[1]+y[5]*(y[10]-1/params[1]))*(1-x[it_+0*nb_row_x])));
g1[125]=(-((1-x[it_+0*nb_row_x])*y[4]*params[7]*(y[10]-1/params[1])));
g1[499]=1;
g1[851]=y[4]*params[7]*(1/params[1]+y[5]*(y[10]-1/params[1]));
g1[60]=(-params[8]);
g1[522]=1;
g1[237]=y[2];
g1[61]=y[10]-params[10]*(1-params[7]-params[8]);
g1[281]=1;
g1[545]=params[10];
g1[149]=params[10]/params[1];
g1[589]=(-1);
g1[40]=(-((params[4]+params[5])*(1-x[it_+1*nb_row_x])));
g1[84]=(-((1-x[it_+1*nb_row_x])*params[10]*T[2]));
g1[590]=1;
g1[876]=(-(y[1]*(-(params[4]+params[5]))+T[1]*(-params[10])));
g1[217]=1;
g1[349]=params[10];
g1[262]=1;
g1[460]=(-1);
g1[570]=params[10];
g1[879]=(-1);
g1[659]=1;
}

