class Solution {
  int stoneGameII(List<int> piles) {
    int n = piles.length;

    List<int> suffix = List.filled(n + 1, 0);

    for (int i = n - 1; i >= 0; i--) {
      suffix[i] = suffix[i + 1] + piles[i];
    }

    Map<String, int> memo = {};

    int solve(int i, int m) {
      if (i >= n) return 0;

      String key = "$i,$m";
      if (memo.containsKey(key)) return memo[key]!;

      int total = suffix[i];
      int best = 0;

      for (int x = 1; x <= 2 * m && i + x <= n; x++) {
        int opponent = solve(i + x, x > m ? x : m);
        best = best > (total - opponent) ? best : (total - opponent);
      }

      memo[key] = best;
      return best;
    }

    return solve(0, 1);
  }
}