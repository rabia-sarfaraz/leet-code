
class Solution {
  int maxAlternatingSum(List<int> nums) {
    nums.sort((a, b) => a.abs().compareTo(b.abs()));

    int n = nums.length;
    int sum = 0;

    for (int i = 0; i < n; i++) {
      int square = nums[i] * nums[i];

      if (i < n ~/ 2) {
        sum -= square;
      } else {
        sum += square;
      }
    }

    return sum;
  }
}
