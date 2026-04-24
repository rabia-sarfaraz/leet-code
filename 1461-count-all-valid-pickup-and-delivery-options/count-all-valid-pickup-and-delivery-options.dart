class Solution {
  int countOrders(int n) {
    const int MOD = 1000000007;
    int ways = 1;

    for (int i = 1; i <= n; i++) {
      ways = (ways * i) % MOD;
      ways = (ways * (2 * i - 1)) % MOD;
    }

    return ways;
  }
}