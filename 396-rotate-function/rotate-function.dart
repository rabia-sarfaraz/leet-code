class Solution {
  int maxRotateFunction(List<int> nums) {
    int n = nums.length;

    int sum = 0;
    int f0 = 0;

    for (int i = 0; i < n; i++) {
      sum += nums[i];
      f0 += i * nums[i];
    }

    int maxVal = f0;
    int prev = f0;

    for (int k = 1; k < n; k++) {
      prev = prev + sum - n * nums[n - k];
      if (prev > maxVal) {
        maxVal = prev;
      }
    }

    return maxVal; // ✅ guaranteed return
  }
}