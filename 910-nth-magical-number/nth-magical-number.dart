class Solution {
  int nthMagicalNumber(int n, int a, int b) {
    int mod = 1000000007;

    int l = 1;
    int r = n * (a < b ? a : b);

    int lcmVal = lcm(a, b);

    while (l < r) {
      int mid = l + (r - l) ~/ 2;

      int count = mid ~/ a + mid ~/ b - mid ~/ lcmVal;

      if (count < n) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }

    return l % mod;
  }

  int gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  int lcm(int a, int b) {
    return (a ~/ gcd(a, b)) * b;
  }
}