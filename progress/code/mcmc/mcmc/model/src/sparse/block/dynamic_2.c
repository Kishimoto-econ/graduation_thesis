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

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  if (nrhs != 8)
    mexErrMsgTxt("Accepts exactly 8 input arguments");
  if (nlhs < 2 || nlhs > 4)
    mexErrMsgTxt("Accepts 2 to 4 output arguments");
  if (!(mxIsDouble(prhs[0]) && !mxIsComplex(prhs[0]) && !mxIsSparse(prhs[0]) && mxGetNumberOfElements(prhs[0]) == 66))
    mexErrMsgTxt("y must be a real dense numeric array with 66 elements");
  if (!(mxIsDouble(prhs[1]) && !mxIsComplex(prhs[1]) && !mxIsSparse(prhs[1]) && mxGetNumberOfElements(prhs[1]) == 2))
    mexErrMsgTxt("x must be a real dense numeric array with 2 elements");
  const double *restrict x = mxGetPr(prhs[1]);
  if (!(mxIsDouble(prhs[2]) && !mxIsComplex(prhs[2]) && !mxIsSparse(prhs[2]) && mxGetNumberOfElements(prhs[2]) == 38))
    mexErrMsgTxt("params must be a real dense numeric array with 38 elements");
  const double *restrict params = mxGetPr(prhs[2]);
  if (!(mxIsDouble(prhs[3]) && !mxIsComplex(prhs[3]) && !mxIsSparse(prhs[3]) && mxGetNumberOfElements(prhs[3]) == 22))
    mexErrMsgTxt("steady_state must be a real dense numeric array with 22 elements");
  const double *restrict steady_state = mxGetPr(prhs[3]);
  plhs[0] = mxDuplicateArray(prhs[0]);
  double *restrict y = mxGetPr(plhs[0]);
  if (!(mxIsInt32(prhs[4]) && mxGetNumberOfElements(prhs[4]) == 52))
    mexErrMsgTxt("sparse_rowval must be an int32 array with 52 elements");
  if (!(mxIsInt32(prhs[6]) && mxGetNumberOfElements(prhs[6]) == 46))
    mexErrMsgTxt("sparse_colptr must be an int32 array with 46 elements");
#if MX_HAS_INTERLEAVED_COMPLEX
  const int32_T *restrict sparse_rowval = mxGetInt32s(prhs[4]);
  const int32_T *restrict sparse_colptr = mxGetInt32s(prhs[6]);
#else
  const int32_T *restrict sparse_rowval = (int32_T *) mxGetData(prhs[4]);
  const int32_T *restrict sparse_colptr = (int32_T *) mxGetData(prhs[6]);
#endif
  if (!(mxIsDouble(prhs[7]) && !mxIsComplex(prhs[7]) && !mxIsSparse(prhs[7]) && mxGetNumberOfElements(prhs[7]) >= 0))
    mexErrMsgTxt("T must be a real dense numeric array with at least 0 elements");
  plhs[1] = mxDuplicateArray(prhs[7]);
  double *restrict T = mxGetPr(plhs[1]);
  mxArray *residual_mx = mxCreateDoubleMatrix(15, 1, mxREAL);
  double *restrict residual = mxGetPr(residual_mx);
  if (nlhs > 2)
    plhs[2] = residual_mx;
  residual[0]=(y[26])-(y[1]*params[5]);
  residual[1]=(y[41])-(params[16]*(y[0]-params[19])+params[17]*(y[12]-params[34])+params[18]*(y[3]-params[22]));
  residual[2]=(y[34])-(y[36]+y[37]);
  residual[3]=(y[37])-(y[3]*params[8]);
  residual[4]=(y[23]+y[29]*params[10])-(params[11]);
  residual[5]=(y[22]*(y[23]-y[1])+y[24]*y[3]+y[26])-(y[25]+y[1]*(params[4]+params[5])*(1-y[65]));
  residual[6]=(y[25]*y[46])-(y[23]*y[44]);
  residual[7]=(y[35])-(y[32]/(params[9]-y[31]));
  residual[8]=(y[25])-(y[35]*y[34]*(1+y[41]));
  residual[9]=(y[22])-(params[1]*(y[44]+pow(params[6]+y[29],params[3]-1)*params[3]*(1-y[65])));
  residual[10]=(y[31])-((1-params[7])*params[2]*(y[46]-1/params[1])+params[7]*params[2]*y[52]*y[53]);
  residual[11]=(y[32])-(1-params[7]+params[7]*params[2]*y[55]*y[54]);
  residual[12]=(y[33])-(1/params[1]+(y[46]-1/params[1])*y[35]);
  residual[13]=(y[30])-(y[33]*y[35]/y[13]);
  residual[14]=(y[36])-(y[12]*params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]))*(1-x[0]));
  if (nlhs > 3)
    {
  plhs[3] = mxCreateSparse(15, 45, 52, mxREAL);
  mwIndex *restrict ir = mxGetIr(plhs[3]), *restrict jc = mxGetJc(plhs[3]);
  for (mwSize i = 0; i < 52; i++)
    *ir++ = *sparse_rowval++ - 1;
  for (mwSize i = 0; i < 46; i++)
    *jc++ = *sparse_colptr++ - 1;
      double *restrict g1_v = mxGetPr(plhs[3]);
g1_v[0]=(-params[18]);
g1_v[1]=(-params[8]);
g1_v[2]=y[24];
g1_v[3]=(-params[5]);
g1_v[4]=(-y[22])-(params[4]+params[5])*(1-y[65]);
g1_v[5]=(-(y[33]*(-y[35])/(y[13]*y[13])));
g1_v[6]=(-((1-x[0])*y[12]*params[7]*(y[24]-1/params[1])));
g1_v[7]=(-params[17]);
g1_v[8]=(-(params[7]*(1/params[1]+y[13]*(y[24]-1/params[1]))*(1-x[0])));
g1_v[9]=(-params[16]);
g1_v[10]=1;
g1_v[11]=1;
g1_v[12]=1;
g1_v[13]=(-(y[35]*y[34]));
g1_v[14]=(-1);
g1_v[15]=1;
g1_v[16]=(-1);
g1_v[17]=1;
g1_v[18]=params[10];
g1_v[19]=(-(params[1]*params[3]*(1-y[65])*getPowerDeriv(params[6]+y[29],params[3]-1,1)));
g1_v[20]=(-1);
g1_v[21]=y[46];
g1_v[22]=1;
g1_v[23]=1;
g1_v[24]=y[22];
g1_v[25]=(-y[44]);
g1_v[26]=1;
g1_v[27]=(-(y[34]*(1+y[41])));
g1_v[28]=(-(y[46]-1/params[1]));
g1_v[29]=(-(y[33]*1/y[13]));
g1_v[30]=1;
g1_v[31]=(-(y[35]*(1+y[41])));
g1_v[32]=y[23]-y[1];
g1_v[33]=1;
g1_v[34]=(-(y[32]/((params[9]-y[31])*(params[9]-y[31]))));
g1_v[35]=1;
g1_v[36]=(-(1/(params[9]-y[31])));
g1_v[37]=1;
g1_v[38]=1;
g1_v[39]=(-(y[35]/y[13]));
g1_v[40]=1;
g1_v[41]=y[3];
g1_v[42]=(-((1-x[0])*y[12]*params[7]*y[13]));
g1_v[43]=(-y[23]);
g1_v[44]=(-params[1]);
g1_v[45]=(-(params[7]*params[2]*y[52]));
g1_v[46]=(-(params[7]*params[2]*y[55]));
g1_v[47]=(-(params[7]*params[2]*y[54]));
g1_v[48]=(-(params[7]*params[2]*y[53]));
g1_v[49]=y[25];
g1_v[50]=(-((1-params[7])*params[2]));
g1_v[51]=(-y[35]);
    }
}
