
class Solution {
  int sumOfSquares(List<int> nums) {
    int sum = 0;
    int n = nums.length;

    for (int i = 0; i < n; i++) {
      if (n % (i + 1) == 0) {
        sum += nums[i] * nums[i];
      }
    }

    return sum;
  }
}
