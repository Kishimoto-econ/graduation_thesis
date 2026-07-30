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

void static_g2(const double *restrict y, const double *restrict x, const double *restrict params, const double *restrict T, double *restrict g2_i, double *restrict g2_j, double *restrict g2_v)
{
g2_i[0]=2;
g2_i[1]=2;
g2_i[2]=2;
g2_i[3]=2;
g2_i[4]=3;
g2_i[5]=3;
g2_i[6]=3;
g2_i[7]=3;
g2_i[8]=5;
g2_i[9]=5;
g2_i[10]=5;
g2_i[11]=5;
g2_i[12]=6;
g2_i[13]=6;
g2_i[14]=6;
g2_i[15]=6;
g2_i[16]=7;
g2_i[17]=7;
g2_i[18]=7;
g2_i[19]=8;
g2_i[20]=8;
g2_i[21]=9;
g2_i[22]=9;
g2_i[23]=10;
g2_i[24]=10;
g2_i[25]=10;
g2_i[26]=11;
g2_i[27]=11;
g2_i[28]=11;
g2_i[29]=11;
g2_i[30]=11;
g2_i[31]=11;
g2_i[32]=13;
g2_i[33]=13;
g2_i[34]=16;
g2_i[35]=16;
g2_i[36]=16;
g2_i[37]=16;
g2_i[38]=16;
g2_i[39]=16;
g2_i[40]=18;
g2_i[41]=18;
g2_i[42]=19;
g2_j[0]=44;
g2_j[1]=464;
g2_j[2]=48;
g2_j[3]=69;
g2_j[4]=2;
g2_j[5]=23;
g2_j[6]=48;
g2_j[7]=69;
g2_j[8]=50;
g2_j[9]=113;
g2_j[10]=51;
g2_j[11]=135;
g2_j[12]=6;
g2_j[13]=111;
g2_j[14]=7;
g2_j[15]=133;
g2_j[16]=162;
g2_j[17]=176;
g2_j[18]=470;
g2_j[19]=186;
g2_j[20]=207;
g2_j[21]=232;
g2_j[22]=253;
g2_j[23]=208;
g2_j[24]=209;
g2_j[25]=230;
g2_j[26]=278;
g2_j[27]=299;
g2_j[28]=284;
g2_j[29]=431;
g2_j[30]=306;
g2_j[31]=432;
g2_j[32]=58;
g2_j[33]=289;
g2_j[34]=57;
g2_j[35]=267;
g2_j[36]=58;
g2_j[37]=289;
g2_j[38]=278;
g2_j[39]=299;
g2_j[40]=48;
g2_j[41]=69;
g2_j[42]=162;
g2_v[0]=params[4]+params[5];
g2_v[1]=g2_v[0];
g2_v[2]=1;
g2_v[3]=g2_v[2];
g2_v[4]=(-1);
g2_v[5]=g2_v[4];
g2_v[6]=1;
g2_v[7]=g2_v[6];
g2_v[8]=(-params[0]);
g2_v[9]=g2_v[8];
g2_v[10]=(-1);
g2_v[11]=g2_v[10];
g2_v[12]=1-params[0];
g2_v[13]=g2_v[12];
g2_v[14]=(-1);
g2_v[15]=g2_v[14];
g2_v[16]=(-(params[1]*(1-y[21])*params[3]*getPowerDeriv(params[6]+y[7],params[3]-1,2)));
g2_v[17]=(-(params[1]*T[1]*(-params[3])));
g2_v[18]=g2_v[17];
g2_v[19]=(-(params[7]*params[2]));
g2_v[20]=g2_v[19];
g2_v[21]=(-(params[7]*params[2]));
g2_v[22]=g2_v[21];
g2_v[23]=(-((-(y[10]*((-(params[9]-y[9]))-(params[9]-y[9]))))/((params[9]-y[9])*(params[9]-y[9])*(params[9]-y[9])*(params[9]-y[9]))));
g2_v[24]=(-(1/((params[9]-y[9])*(params[9]-y[9]))));
g2_v[25]=g2_v[24];
g2_v[26]=(-(1+y[19]));
g2_v[27]=g2_v[26];
g2_v[28]=(-y[13]);
g2_v[29]=g2_v[28];
g2_v[30]=(-y[12]);
g2_v[31]=g2_v[30];
g2_v[32]=(-1);
g2_v[33]=g2_v[32];
g2_v[34]=(-((1-x[0])*params[7]*y[13]));
g2_v[35]=g2_v[34];
g2_v[36]=(-((1-x[0])*params[7]*y[12]));
g2_v[37]=g2_v[36];
g2_v[38]=(-((1-x[0])*params[7]*(y[2]-1/params[1])));
g2_v[39]=g2_v[38];
g2_v[40]=1;
g2_v[41]=g2_v[40];
g2_v[42]=(-((1-x[1])*params[10]*getPowerDeriv(params[6]+y[7],params[3],2)));
}

