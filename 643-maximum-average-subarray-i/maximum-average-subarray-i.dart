class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int n = nums.length;

    int windowSum = 0;

    // first window
    for (int i = 0; i < k; i++) {
      windowSum += nums[i];
    }

    int maxSum = windowSum;

    // slide window
    for (int i = k; i < n; i++) {
      windowSum += nums[i] - nums[i - k];
      if (windowSum > maxSum) {
        maxSum = windowSum;
      }
    }

    return maxSum / k;
  }
}