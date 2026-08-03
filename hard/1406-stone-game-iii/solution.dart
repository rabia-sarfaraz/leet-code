class Solution {
  String stoneGameIII(List<int> stoneValue) {
    int n = stoneValue.length;
    List<int> dp = List.filled(n + 1, 0);

    for (int i = n - 1; i >= 0; i--) {
      int take = 0;
      dp[i] = -1000000000;

      for (int k = 0; k < 3 && i + k < n; k++) {
        take += stoneValue[i + k];
        dp[i] = dp[i] > take - dp[i + k + 1]
            ? dp[i]
            : take - dp[i + k + 1];
      }
    }

    if (dp[0] > 0) return "Alice";
    if (dp[0] < 0) return "Bob";
    return "Tie";
  }
}