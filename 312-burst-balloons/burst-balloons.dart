class Solution {
  int maxCoins(List<int> nums) {
    int n = nums.length;

    // new array with 1 at both ends
    List<int> arr = [1, ...nums, 1];
    int m = arr.length;

    // dp table
    List<List<int>> dp = List.generate(
        m, (_) => List.filled(m, 0));

    // length of interval
    for (int len = 2; len < m; len++) {
      for (int left = 0; left + len < m; left++) {
        int right = left + len;

        for (int k = left + 1; k < right; k++) {
          int coins = arr[left] * arr[k] * arr[right]
              + dp[left][k]
              + dp[k][right];

          if (coins > dp[left][right]) {
            dp[left][right] = coins;
          }
        }
      }
    }

    return dp[0][m - 1];
  }
}