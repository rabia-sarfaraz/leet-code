class Solution {
  int maxSubarraySumCircular(List<int> nums) {
    int totalSum = 0;

    int maxSum = nums[0], curMax = 0;
    int minSum = nums[0], curMin = 0;

    for (int num in nums) {
      // Kadane max
      curMax = (curMax + num) > num ? (curMax + num) : num;
      maxSum = maxSum > curMax ? maxSum : curMax;

      // Kadane min
      curMin = (curMin + num) < num ? (curMin + num) : num;
      minSum = minSum < curMin ? minSum : curMin;

      totalSum += num;
    }

    // all negative case
    if (maxSum < 0) return maxSum;

    return (maxSum > (totalSum - minSum)) 
        ? maxSum 
        : (totalSum - minSum);
  }
}