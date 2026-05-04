class Solution {
  int numberOfArrays(String s, int k) {
    int n = s.length;
    int MOD = 1000000007;

    List<int> dp = List.filled(n + 1, 0);
    dp[n] = 1; // base case

    for (int i = n - 1; i >= 0; i--) {
      if (s[i] == '0') continue; // leading zero not allowed

      int num = 0;

      for (int j = i; j < n; j++) {
        num = num * 10 + (s[j].codeUnitAt(0) - '0'.codeUnitAt(0));

        if (num > k) break;

        dp[i] = (dp[i] + dp[j + 1]) % MOD;
      }
    }

    return dp[0];
  }
}