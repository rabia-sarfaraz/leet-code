class Solution {
  int maxSumAfterPartitioning(List<int> arr, int k) {
    int n = arr.length;
    List<int> dp = List.filled(n + 1, 0);

    for (int i = 1; i <= n; i++) {
      int maxVal = 0;

      for (int j = 1; j <= k && i - j >= 0; j++) {
        maxVal = maxVal > arr[i - j] ? maxVal : arr[i - j];

        int candidate = dp[i - j] + maxVal * j;
        dp[i] = dp[i] > candidate ? dp[i] : candidate;
      }
    }

    return dp[n];
  }
}