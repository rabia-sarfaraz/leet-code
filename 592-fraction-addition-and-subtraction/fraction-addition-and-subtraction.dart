class Solution {
  String fractionAddition(String expression) {
    int num = 0; // numerator
    int den = 1; // denominator

    int i = 0;
    int n = expression.length;

    while (i < n) {
      // read sign
      int sign = 1;
      if (expression[i] == '+' || expression[i] == '-') {
        if (expression[i] == '-') sign = -1;
        i++;
      }

      // read numerator
      int n1 = 0;
      while (i < n && expression[i].contains(RegExp(r'[0-9]'))) {
        n1 = n1 * 10 + (expression[i].codeUnitAt(0) - '0'.codeUnitAt(0));
        i++;
      }
      n1 *= sign;

      // skip '/'
      i++;

      // read denominator
      int d1 = 0;
      while (i < n && expression[i].contains(RegExp(r'[0-9]'))) {
        d1 = d1 * 10 + (expression[i].codeUnitAt(0) - '0'.codeUnitAt(0));
        i++;
      }

      // add fraction (num/den + n1/d1)
      num = num * d1 + n1 * den;
      den = den * d1;

      // reduce
      int g = gcd(num.abs(), den.abs());
      num ~/= g;
      den ~/= g;
    }

    // ensure denominator positive
    if (den < 0) {
      den = -den;
      num = -num;
    }

    return "$num/$den";
  }

  int gcd(int a, int b) {
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}