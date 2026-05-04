class Solution {
  int minStartValue(List<int> nums) {
    int sum = 0;
    int minSum = 0;

    for (int num in nums) {
      sum += num;
      if (sum < minSum) {
        minSum = sum;
      }
    }

    return 1 - minSum;
  }
}