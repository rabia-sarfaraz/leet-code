class Solution {
  double myPow(double x, int n) {
    double doublePow(double base, int exp) {
      if (exp == 0) return 1.0;

      double half = doublePow(base, exp ~/ 2);

      if (exp % 2 == 0) {
        return half * half;
      } else {
        return half * half * base;
      }
    }

    if (n < 0) {
      x = 1 / x;
      n = -n;
    }

    return doublePow(x, n);
  }
}