class Solution {
  int atMostNGivenDigitSet(List<String> digits, int n) {
    String s = n.toString();
    int len = s.length;

    int d = digits.length;
    int res = 0;

    // 1. numbers with smaller length
    int power = 1;
    for (int i = 1; i < len; i++) {
      power *= d;
      res += power;
    }

    // 2. same length
    for (int i = 0; i < len; i++) {
      bool found = false;

      for (String dig in digits) {
        if (dig[0].compareTo(s[i]) < 0) {
          res += pow(d, len - i - 1);
        } else if (dig[0] == s[i]) {
          found = true;
        }
      }

      if (!found) {
        return res;
      }
    }

    return res + 1;
  }

  int pow(int a, int b) {
    int res = 1;
    for (int i = 0; i < b; i++) {
      res *= a;
    }
    return res;
  }
}