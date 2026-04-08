import 'dart:math';

class Solution {
  bool judgeSquareSum(int c) {
    int a = 0;
    int b = sqrt(c).floor();

    while (a <= b) {
      int sum = a * a + b * b;

      if (sum == c) return true;
      if (sum < c) {
        a++;
      } else {
        b--;
      }
    }

    return false;
  }
}