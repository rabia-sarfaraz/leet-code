class Solution {
  void nextPermutation(List<int> nums) {
    int n = nums.length;
    int i = n - 2;

    // Step 1: find first decreasing element
    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    // Step 2: find just larger element and swap
    if (i >= 0) {
      int j = n - 1;
      while (nums[j] <= nums[i]) {
        j--;
      }
      int temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
    }

    // Step 3: reverse the right part
    reverse(nums, i + 1, n - 1);
  }

  void reverse(List<int> nums, int start, int end) {
    while (start < end) {
      int temp = nums[start];
      nums[start] = nums[end];
      nums[end] = temp;
      start++;
      end--;
    }
  }
}