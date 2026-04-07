class Solution {
  int numberOfArithmeticSlices(List<int> nums) {
    int n = nums.length;
    int total = 0;

    List<Map<int, int>> dp = List.generate(n, (_) => {});

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        int diff = nums[i] - nums[j];

        int count = dp[j][diff] ?? 0;

        total += count;

        dp[i][diff] = (dp[i][diff] ?? 0) + count + 1;
      }
    }

    return total;
  }
}