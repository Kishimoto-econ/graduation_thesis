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

void dynamic_resid_tt(const double *restrict y, const double *restrict x, int nb_row_x, const double *restrict params, const double *restrict steady_state, int it_, double *restrict T)
{
T[0] = pow(params[6]+y[15],params[3]-1);
T[1] = pow(params[6]+y[3],params[3]);
}

