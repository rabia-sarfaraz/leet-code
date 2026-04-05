class Solution {
  int nthSuperUglyNumber(int n, List<int> primes) {
    int k = primes.length;

    List<int> dp = List.filled(n, 0);
    dp[0] = 1;

    List<int> idx = List.filled(k, 0);
    List<int> nextVal = List.from(primes);

    for (int i = 1; i < n; i++) {
      int nextUgly = nextVal.reduce((a, b) => a < b ? a : b);
      dp[i] = nextUgly;

      for (int j = 0; j < k; j++) {
        if (nextVal[j] == nextUgly) {
          idx[j]++;
          nextVal[j] = dp[idx[j]] * primes[j];
        }
      }
    }

    return dp[n - 1];
  }
}