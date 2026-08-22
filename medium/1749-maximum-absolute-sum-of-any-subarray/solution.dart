class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int maxSum = 0;
    int minSum = 0;
    int currentMax = 0;
    int currentMin = 0;

    for (int num in nums) {
      currentMax = (currentMax + num > 0) ? currentMax + num : 0;
      currentMin = (currentMin + num < 0) ? currentMin + num : 0;

      maxSum = maxSum > currentMax ? maxSum : currentMax;
      minSum = minSum < currentMin ? minSum : currentMin;
    }

    return maxSum > -minSum ? maxSum : -minSum;
  }
}