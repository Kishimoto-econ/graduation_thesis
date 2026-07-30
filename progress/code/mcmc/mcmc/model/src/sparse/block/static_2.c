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
  if (nrhs != 7)
    mexErrMsgTxt("Accepts exactly 7 input arguments");
  if (nlhs < 2 || nlhs > 4)
    mexErrMsgTxt("Accepts 2 to 4 output arguments");
  if (!(mxIsDouble(prhs[0]) && !mxIsComplex(prhs[0]) && !mxIsSparse(prhs[0]) && mxGetNumberOfElements(prhs[0]) == 22))
    mexErrMsgTxt("y must be a real dense numeric array with 22 elements");
  if (!(mxIsDouble(prhs[1]) && !mxIsComplex(prhs[1]) && !mxIsSparse(prhs[1]) && mxGetNumberOfElements(prhs[1]) == 2))
    mexErrMsgTxt("x must be a real dense numeric array with 2 elements");
  const double *restrict x = mxGetPr(prhs[1]);
  if (!(mxIsDouble(prhs[2]) && !mxIsComplex(prhs[2]) && !mxIsSparse(prhs[2]) && mxGetNumberOfElements(prhs[2]) == 38))
    mexErrMsgTxt("params must be a real dense numeric array with 38 elements");
  const double *restrict params = mxGetPr(prhs[2]);
  plhs[0] = mxDuplicateArray(prhs[0]);
  double *restrict y = mxGetPr(plhs[0]);
  if (!(mxIsInt32(prhs[3]) && mxGetNumberOfElements(prhs[3]) == 44))
    mexErrMsgTxt("sparse_rowval must be an int32 array with 44 elements");
  if (!(mxIsInt32(prhs[5]) && mxGetNumberOfElements(prhs[5]) == 16))
    mexErrMsgTxt("sparse_colptr must be an int32 array with 16 elements");
#if MX_HAS_INTERLEAVED_COMPLEX
  const int32_T *restrict sparse_rowval = mxGetInt32s(prhs[3]);
  const int32_T *restrict sparse_colptr = mxGetInt32s(prhs[5]);
#else
  const int32_T *restrict sparse_rowval = (int32_T *) mxGetData(prhs[3]);
  const int32_T *restrict sparse_colptr = (int32_T *) mxGetData(prhs[5]);
#endif
  if (!(mxIsDouble(prhs[6]) && !mxIsComplex(prhs[6]) && !mxIsSparse(prhs[6]) && mxGetNumberOfElements(prhs[6]) >= 0))
    mexErrMsgTxt("T must be a real dense numeric array with at least 0 elements");
  plhs[1] = mxDuplicateArray(prhs[6]);
  double *restrict T = mxGetPr(plhs[1]);
  mxArray *residual_mx = mxCreateDoubleMatrix(15, 1, mxREAL);
  double *restrict residual = mxGetPr(residual_mx);
  if (nlhs > 2)
    plhs[2] = residual_mx;
  residual[0]=(y[2]*y[3])-(y[0]*y[1]);
  residual[1]=(y[4])-(y[1]*params[5]);
  residual[2]=(y[0])-(params[1]*(y[0]+pow(params[6]+y[7],params[3]-1)*(1-y[21])*params[3]));
  residual[3]=(y[9])-((1-params[7])*params[2]*(y[2]-1/params[1])+y[9]*params[7]*params[2]*y[8]);
  residual[4]=(y[10])-(1-params[7]+y[10]*params[7]*params[2]*y[11]);
  residual[5]=(y[13])-(y[10]/(params[9]-y[9]));
  residual[6]=(y[3])-(y[13]*y[12]*(1+y[19]));
  residual[7]=(y[19])-(params[16]*(y[0]-params[19])+params[17]*(y[12]-params[34])+params[18]*(y[3]-params[22]));
  residual[8]=(y[11])-(1/params[1]+(y[2]-1/params[1])*y[13]);
  residual[9]=(y[8])-(y[11]);
  residual[10]=(y[12])-(y[14]+y[15]);
  residual[11]=(y[14])-(y[12]*params[7]*(1/params[1]+(y[2]-1/params[1])*y[13])*(1-x[0]));
  residual[12]=(y[15])-(y[3]*params[8]);
  residual[13]=(y[2]*y[3]+y[4])-(y[3]+y[1]*(params[4]+params[5])*(1-y[21]));
  residual[14]=(y[1]+y[7]*params[10])-(params[11]);
  if (nlhs > 3)
    {
  plhs[3] = mxCreateSparse(15, 15, 44, mxREAL);
  mwIndex *restrict ir = mxGetIr(plhs[3]), *restrict jc = mxGetJc(plhs[3]);
  for (mwSize i = 0; i < 44; i++)
    *ir++ = *sparse_rowval++ - 1;
  for (mwSize i = 0; i < 16; i++)
    *jc++ = *sparse_colptr++ - 1;
      double *restrict g1_v = mxGetPr(plhs[3]);
g1_v[0]=(-y[0]);
g1_v[1]=(-params[5]);
g1_v[2]=(-((params[4]+params[5])*(1-y[21])));
g1_v[3]=1;
g1_v[4]=1;
g1_v[5]=1;
g1_v[6]=(-y[1]);
g1_v[7]=1-params[1];
g1_v[8]=(-params[16]);
g1_v[9]=1-params[7]*params[2]*y[8];
g1_v[10]=(-(y[10]/((params[9]-y[9])*(params[9]-y[9]))));
g1_v[11]=1-params[7]*params[2]*y[11];
g1_v[12]=(-(1/(params[9]-y[9])));
g1_v[13]=1;
g1_v[14]=(-(y[12]*(1+y[19])));
g1_v[15]=(-(y[2]-1/params[1]));
g1_v[16]=(-((1-x[0])*y[12]*params[7]*(y[2]-1/params[1])));
g1_v[17]=(-(y[13]*y[12]));
g1_v[18]=1;
g1_v[19]=(-(y[13]*(1+y[19])));
g1_v[20]=(-params[17]);
g1_v[21]=1;
g1_v[22]=(-(params[7]*(1/params[1]+(y[2]-1/params[1])*y[13])*(1-x[0])));
g1_v[23]=(-(params[7]*params[2]*y[10]));
g1_v[24]=1;
g1_v[25]=(-1);
g1_v[26]=(-(y[9]*params[7]*params[2]));
g1_v[27]=1;
g1_v[28]=(-1);
g1_v[29]=1;
g1_v[30]=y[3];
g1_v[31]=(-((1-params[7])*params[2]));
g1_v[32]=(-y[13]);
g1_v[33]=(-((1-x[0])*y[12]*params[7]*y[13]));
g1_v[34]=y[3];
g1_v[35]=(-1);
g1_v[36]=1;
g1_v[37]=y[2];
g1_v[38]=1;
g1_v[39]=(-params[18]);
g1_v[40]=(-params[8]);
g1_v[41]=y[2]-1;
g1_v[42]=(-(params[1]*(1-y[21])*params[3]*getPowerDeriv(params[6]+y[7],params[3]-1,1)));
g1_v[43]=params[10];
    }
}
