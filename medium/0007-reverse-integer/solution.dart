class Solution {
  int reverse(int x) {
    int sign = x < 0 ? -1 : 1;
    int num = x.abs();
    int result = 0;

    while (num > 0) {
      int digit = num % 10;
      result = result * 10 + digit;
      num ~/= 10;
    }

    result *= sign;

    // 32-bit signed integer range
    if (result < -2147483648 || result > 2147483647) {
      return 0;
    }

    return result;
  }
}