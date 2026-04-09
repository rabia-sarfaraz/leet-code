class Solution {
  int numFactoredBinaryTrees(List<int> arr) {
    arr.sort();

    Map<int, int> dp = {};
    Set<int> set = arr.toSet();

    const int MOD = 1000000007;

    for (int x in arr) {
      dp[x] = 1; // single node tree

      for (int a in arr) {
        if (a > x) break;

        if (x % a == 0) {
          int b = x ~/ a;

          if (set.contains(b)) {
            int left = dp[a]!;
            int right = dp[b]!;

            dp[x] = (dp[x]! + (left * right)) % MOD;
          }
        }
      }
    }

    int res = 0;
    for (int v in dp.values) {
      res = (res + v) % MOD;
    }

    return res;
  }
}