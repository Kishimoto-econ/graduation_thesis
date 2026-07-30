/*
 * "mcmc\\model\\src\\dynamic.c" : Computes dynamic model for Dynare
 *
 * Warning : this file is generated automatically by Dynare
 *           from model file (.mod)
 */

#include <math.h>
#include <stdlib.h>
#include "mex.h"
#include "dynamic_resid_tt.h"
#include "dynamic_resid.h"
#include "dynamic_g1_tt.h"
#include "dynamic_g1.h"
#include "dynamic_g2_tt.h"
#include "dynamic_g2.h"
#include "dynamic_g3_tt.h"
#include "dynamic_g3.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  if (nlhs > 3)
    mexErrMsgTxt("Derivatives of higher order than computed have been requested");
  if (nrhs != 5)
    mexErrMsgTxt("Requires exactly 5 input arguments");

  double *y = mxGetPr(prhs[0]);
  double *x = mxGetPr(prhs[1]);
  double *params = mxGetPr(prhs[2]);
  double *steady_state = mxGetPr(prhs[3]);
  int it_ = (int) mxGetScalar(prhs[4]) - 1;
  int nb_row_x = mxGetM(prhs[1]);

  double *T = (double *) malloc(sizeof(double)*4);

  if (nlhs >= 1)
    {
       plhs[0] = mxCreateDoubleMatrix(22,1, mxREAL);
       double *residual = mxGetPr(plhs[0]);
       dynamic_resid_tt(y, x, nb_row_x, params, steady_state, it_, T);
       dynamic_resid(y, x, nb_row_x, params, steady_state, it_, T, residual);
    }

  if (nlhs >= 2)
    {
       plhs[1] = mxCreateDoubleMatrix(22, 40, mxREAL);
       double *g1 = mxGetPr(plhs[1]);
       dynamic_g1_tt(y, x, nb_row_x, params, steady_state, it_, T);
       dynamic_g1(y, x, nb_row_x, params, steady_state, it_, T, g1);
    }

  if (nlhs >= 3)
    {
      mxArray *g2_i = mxCreateDoubleMatrix(70, 1, mxREAL);
      mxArray *g2_j = mxCreateDoubleMatrix(70, 1, mxREAL);
      mxArray *g2_v = mxCreateDoubleMatrix(70, 1, mxREAL);
      dynamic_g2_tt(y, x, nb_row_x, params, steady_state, it_, T);
      dynamic_g2(y, x, nb_row_x, params, steady_state, it_, T, mxGetPr(g2_i), mxGetPr(g2_j), mxGetPr(g2_v));
      mxArray *m = mxCreateDoubleScalar(22);
      mxArray *n = mxCreateDoubleScalar(1600);
      mxArray *plhs_sparse[1], *prhs_sparse[5] = { g2_i, g2_j, g2_v, m, n };
      mexCallMATLAB(1, plhs_sparse, 5, prhs_sparse, "sparse");
      plhs[2] = plhs_sparse[0];
      mxDestroyArray(g2_i);
      mxDestroyArray(g2_j);
      mxDestroyArray(g2_v);
      mxDestroyArray(m);
      mxDestroyArray(n);
    }

  if (nlhs >= 4)
    {
      mxArray *g3_i = mxCreateDoubleMatrix(0, 1, mxREAL);
      mxArray *g3_j = mxCreateDoubleMatrix(0, 1, mxREAL);
      mxArray *g3_v = mxCreateDoubleMatrix(0, 1, mxREAL);
      dynamic_g3_tt(y, x, nb_row_x, params, steady_state, it_, T);
      dynamic_g3(y, x, nb_row_x, params, steady_state, it_, T, mxGetPr(g3_i), mxGetPr(g3_j), mxGetPr(g3_v));
      mxArray *m = mxCreateDoubleScalar(22);
      mxArray *n = mxCreateDoubleScalar(64000);
      mxArray *plhs_sparse[1], *prhs_sparse[5] = { g3_i, g3_j, g3_v, m, n };
      mexCallMATLAB(1, plhs_sparse, 5, prhs_sparse, "sparse");
      plhs[3] = plhs_sparse[0];
      mxDestroyArray(g3_i);
      mxDestroyArray(g3_j);
      mxDestroyArray(g3_v);
      mxDestroyArray(m);
      mxDestroyArray(n);
    }

  free(T);
}
