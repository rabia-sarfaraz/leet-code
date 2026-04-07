class Solution {
  int largestPalindrome(int n) {
    if (n == 1) return 9;

    int upper = pow10(n) - 1;
    int lower = pow10(n - 1);

    for (int left = upper; left >= lower; left--) {
      String s = left.toString();
      String palStr = s + s.split('').reversed.join('');
      int pal = int.parse(palStr);

      for (int i = upper; i * i >= pal; i--) {
        if (pal % i == 0) {
          int j = pal ~/ i;
          if (j >= lower && j <= upper) {
            return pal % 1337;
          }
        }
      }
    }
    return 0;
  }

  int pow10(int n) {
    int res = 1;
    for (int i = 0; i < n; i++) {
      res *= 10;
    }
    return res;
  }
}