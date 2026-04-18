class Solution {
  int smallestDivisor(List<int> nums, int threshold) {
    int left = 1;
    int right = nums.reduce((a, b) => a > b ? a : b);

    int result = right;

    while (left <= right) {
      int mid = (left + right) ~/ 2;

      int sum = 0;

      for (int num in nums) {
        sum += (num / mid).ceil();
      }

      if (sum <= threshold) {
        result = mid;
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }

    return result;
  }
}