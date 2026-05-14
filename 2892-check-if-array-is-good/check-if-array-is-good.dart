class Solution {
  bool isGood(List<int> nums) {
    nums.sort();

    int n = nums.length;

    // Expected array: [1, 2, 3, ..., n-1, n-1]
    for (int i = 0; i < n - 1; i++) {
      if (nums[i] != i + 1) {
        return false;
      }
    }

    return nums[n - 1] == n - 1;
  }
}