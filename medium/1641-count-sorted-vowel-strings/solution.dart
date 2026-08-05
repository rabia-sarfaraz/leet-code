class Solution {
  int countVowelStrings(int n) {
    List<int> dp = List.filled(5, 1);

    for (int i = 2; i <= n; i++) {
      for (int j = 3; j >= 0; j--) {
        dp[j] += dp[j + 1];
      }
    }

    return dp.reduce((a, b) => a + b);
  }
}