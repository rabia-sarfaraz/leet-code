class Solution {
  int numTilings(int n) {
    const mod = 1000000007;

    if (n <= 2) return n;

    int a = 1, b = 1, c = 2;

    for (int i = 3; i <= n; i++) {
      int d = ((2 * c) % mod + a) % mod;
      a = b;
      b = c;
      c = d;
    }

    return c;
  }
}