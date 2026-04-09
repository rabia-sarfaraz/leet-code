class Solution {
  int numSubarrayBoundedMax(List<int> nums, int left, int right) {
    int start = -1;      // last index where nums[i] > right
    int lastValid = -1;  // last index where left <= nums[i] <= right
    int count = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] > right) {
        start = i;
      }

      if (nums[i] >= left && nums[i] <= right) {
        lastValid = i;
      }

      if (lastValid > start) {
        count += lastValid - start;
      }
    }

    return count;
  }
}