class Solution {
  int ways(List<String> pizza, int k) {
    const int MOD = 1000000007;

    int m = pizza.length;
    int n = pizza[0].length;

    // Prefix sum of apples
    List<List<int>> pre = List.generate(
      m + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (int i = m - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        pre[i][j] =
            (pizza[i][j] == 'A' ? 1 : 0) +
            pre[i + 1][j] +
            pre[i][j + 1] -
            pre[i + 1][j + 1];
      }
    }

    // Memoization
    Map<String, int> memo = {};

    int dfs(int r, int c, int cuts) {
      String key = "$r,$c,$cuts";

      if (memo.containsKey(key)) return memo[key]!;

      // No apple
      if (pre[r][c] == 0) return 0;

      // Last piece
      if (cuts == 1) return 1;

      int ans = 0;

      // Horizontal cuts
      for (int nr = r + 1; nr < m; nr++) {
        if (pre[r][c] - pre[nr][c] > 0) {
          ans = (ans + dfs(nr, c, cuts - 1)) % MOD;
        }
      }

      // Vertical cuts
      for (int nc = c + 1; nc < n; nc++) {
        if (pre[r][c] - pre[r][nc] > 0) {
          ans = (ans + dfs(r, nc, cuts - 1)) % MOD;
        }
      }

      memo[key] = ans;
      return ans;
    }

    return dfs(0, 0, k);
  }
}