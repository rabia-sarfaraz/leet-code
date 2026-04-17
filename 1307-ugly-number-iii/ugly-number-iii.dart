class Solution {
  int nthUglyNumber(int n, int a, int b, int c) {
    int gcd(int x, int y) => y == 0 ? x : gcd(y, x % y);
    int lcm(int x, int y) => (x ~/ gcd(x, y)) * y;

    int lcmAB = lcm(a, b);
    int lcmAC = lcm(a, c);
    int lcmBC = lcm(b, c);
    int lcmABC = lcm(lcmAB, c);

    int count(int x) {
      return x ~/ a +
          x ~/ b +
          x ~/ c -
          x ~/ lcmAB -
          x ~/ lcmAC -
          x ~/ lcmBC +
          x ~/ lcmABC;
    }

    int left = 1, right = 2000000000;

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (count(mid) >= n) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }
}