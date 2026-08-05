class Solution {
  static const int MOD = 1000000007;

  int numWays(List<String> words, String target) {
    int m = words[0].length;
    int n = target.length;

    List<List<int>> cnt =
        List.generate(m, (_) => List.filled(26, 0));

    for (String word in words) {
      for (int i = 0; i < m; i++) {
        cnt[i][word.codeUnitAt(i) - 97]++;
      }
    }

    List<int> dp = List.filled(n + 1, 0);
    dp[0] = 1;

    for (int i = 0; i < m; i++) {
      for (int j = n - 1; j >= 0; j--) {
        int c = target.codeUnitAt(j) - 97;
        dp[j + 1] =
            (dp[j + 1] + dp[j] * cnt[i][c]) % MOD;
      }
    }

    return dp[n];
  }
}