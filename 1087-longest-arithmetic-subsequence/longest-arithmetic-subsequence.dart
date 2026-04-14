class Solution {
  int longestArithSeqLength(List<int> nums) {
    int n = nums.length;
    List<Map<int, int>> dp = List.generate(n, (_) => {});

    int maxLen = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        int diff = nums[i] - nums[j];

        int prev = dp[j][diff] ?? 1;
        dp[i][diff] = prev + 1;

        maxLen = maxLen > dp[i][diff]! ? maxLen : dp[i][diff]!;
      }
    }

    return maxLen;
  }
}