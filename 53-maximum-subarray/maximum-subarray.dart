class Solution {
  int maxSubArray(List<int> nums) {
    int currentSum = nums[0];
    int maxSum = nums[0];

    for (int i = 1; i < nums.length; i++) {
      currentSum = (nums[i] > currentSum + nums[i])
          ? nums[i]
          : currentSum + nums[i];

      maxSum = (currentSum > maxSum) ? currentSum : maxSum;
    }

    return maxSum;
  }
}