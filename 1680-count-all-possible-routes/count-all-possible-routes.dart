class Solution {
  static const int MOD = 1000000007;

  int countRoutes(List<int> locations, int start, int finish, int fuel) {
    int n = locations.length;

    List<List<int>> dp =
        List.generate(n, (_) => List.filled(fuel + 1, -1));

    int dfs(int city, int remain) {
      if (dp[city][remain] != -1) return dp[city][remain];

      int ways = city == finish ? 1 : 0;

      for (int next = 0; next < n; next++) {
        if (next == city) continue;

        int cost = (locations[city] - locations[next]).abs();
        if (cost <= remain) {
          ways = (ways + dfs(next, remain - cost)) % MOD;
        }
      }

      dp[city][remain] = ways;
      return ways;
    }

    return dfs(start, fuel);
  }
}