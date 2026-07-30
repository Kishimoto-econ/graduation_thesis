/*
 * "mcmc\\model\\src\\static.c" : Computes static model for Dynare
 *
 * Warning : this file is generated automatically by Dynare
 *           from model file (.mod)
 */

#include <math.h>
#include <stdlib.h>
#include "mex.h"
#include "static_resid_tt.h"
#include "static_resid.h"
#include "static_g1_tt.h"
#include "static_g1.h"
#include "static_g2_tt.h"
#include "static_g2.h"
#include "static_g3_tt.h"
#include "static_g3.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  if (nrhs > 3)
    mexErrMsgTxt("Accepts at most 3 output arguments");
  if (nrhs != 3)
    mexErrMsgTxt("Requires exactly 3 input arguments");

  double *y = mxGetPr(prhs[0]);
  double *x = mxGetPr(prhs[1]);
  double *params = mxGetPr(prhs[2]);

  double *T = (double *) malloc(sizeof(double)*2);

  if (nlhs >= 1)
    {
       plhs[0] = mxCreateDoubleMatrix(22,1, mxREAL);
       double *residual = mxGetPr(plhs[0]);
       static_resid_tt(y, x, params, T);
       static_resid(y, x, params, T, residual);
    }

  if (nlhs >= 2)
    {
       plhs[1] = mxCreateDoubleMatrix(22, 22, mxREAL);
       double *g1 = mxGetPr(plhs[1]);
       static_g1_tt(y, x, params, T);
       static_g1(y, x, params, T, g1);
    }

  if (nlhs >= 3)
    {
      mxArray *g2_i = mxCreateDoubleMatrix(43, 1, mxREAL);
      mxArray *g2_j = mxCreateDoubleMatrix(43, 1, mxREAL);
      mxArray *g2_v = mxCreateDoubleMatrix(43, 1, mxREAL);
      static_g2_tt(y, x, params, T);
      static_g2(y, x, params, T, mxGetPr(g2_i), mxGetPr(g2_j), mxGetPr(g2_v));
      mxArray *m = mxCreateDoubleScalar(22);
      mxArray *n = mxCreateDoubleScalar(484);
      mxArray *plhs_sparse[1], *prhs_sparse[5] = { g2_i, g2_j, g2_v, m, n };
      mexCallMATLAB(1, plhs_sparse, 5, prhs_sparse, "sparse");
      plhs[2] = plhs_sparse[0];
      mxDestroyArray(g2_i);
      mxDestroyArray(g2_j);
      mxDestroyArray(g2_v);
      mxDestroyArray(m);
      mxDestroyArray(n);
    }

  free(T);
}
