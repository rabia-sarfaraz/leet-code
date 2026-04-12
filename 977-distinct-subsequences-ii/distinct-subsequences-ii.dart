class Solution {
  int distinctSubseqII(String s) {
    const int MOD = 1000000007;

    List<int> dp = List.filled(s.length + 1, 0);

    // dp[i] = total subsequences till i
    dp[0] = 1; // empty subsequence

    Map<String, int> last = {};

    for (int i = 1; i <= s.length; i++) {
      String ch = s[i - 1];

      dp[i] = (2 * dp[i - 1]) % MOD;

      if (last.containsKey(ch)) {
        int j = last[ch]!;
        dp[i] = (dp[i] - dp[j - 1] + MOD) % MOD;
      }

      last[ch] = i;
    }

    return (dp[s.length] - 1 + MOD) % MOD;
  }
}