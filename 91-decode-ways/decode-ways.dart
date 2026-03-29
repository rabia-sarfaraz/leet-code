class Solution {
  int numDecodings(String s) {
    if (s.isEmpty || s[0] == '0') return 0;

    int n = s.length;
    List<int> dp = List.filled(n + 1, 0);

    dp[0] = 1;
    dp[1] = 1;

    for (int i = 2; i <= n; i++) {
      int oneDigit = int.parse(s.substring(i - 1, i));
      int twoDigits = int.parse(s.substring(i - 2, i));

      if (oneDigit >= 1 && oneDigit <= 9) {
        dp[i] += dp[i - 1];
      }

      if (twoDigits >= 10 && twoDigits <= 26) {
        dp[i] += dp[i - 2];
      }
    }

    return dp[n];
  }
}