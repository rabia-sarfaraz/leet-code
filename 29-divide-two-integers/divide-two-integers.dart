class Solution {
  int divide(int dividend, int divisor) {
    // Handle overflow
    if (dividend == -2147483648 && divisor == -1) {
      return 2147483647;
    }

    // Sign determine
    int sign = ((dividend < 0) ^ (divisor < 0)) ? -1 : 1;

    int dvd = dividend.abs();
    int dvs = divisor.abs();

    int result = 0;

    while (dvd >= dvs) {
      int temp = dvs;
      int multiple = 1;

      while (dvd >= (temp << 1)) {
        temp <<= 1;
        multiple <<= 1;
      }

      dvd -= temp;
      result += multiple;
    }

    return sign == 1 ? result : -result;
  }
}