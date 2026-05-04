class Solution {
  int numOfWays(int n) {
    int A = 6, B = 6;
    int MOD = 1000000007;

    for (int i = 2; i <= n; i++) {
      int newA = (A * 3 + B * 2) % MOD;
      int newB = (A * 2 + B * 2) % MOD;

      A = newA;
      B = newB;
    }

    return (A + B) % MOD;
  }
}