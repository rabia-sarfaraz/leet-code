class Solution {
  int numMusicPlaylists(int n, int goal, int k) {
    int MOD = 1000000007;

    List<List<int>> dp = List.generate(
      goal + 1,
      (_) => List.filled(n + 1, 0),
    );

    dp[0][0] = 1;

    for (int i = 1; i <= goal; i++) {
      for (int j = 1; j <= n; j++) {

        // Case 1: add new song
        dp[i][j] = (dp[i][j] +
                (dp[i - 1][j - 1] *
                        (n - (j - 1))) %
                    MOD) %
            MOD;

        // Case 2: replay old song
        if (j > k) {
          dp[i][j] = (dp[i][j] +
                  (dp[i - 1][j] * (j - k)) % MOD) %
              MOD;
        }
      }
    }

    return dp[goal][n];
  }
}