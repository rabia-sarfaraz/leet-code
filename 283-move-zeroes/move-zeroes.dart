class Solution {
  void moveZeroes(List<int> nums) {
    int j = 0;

    // Step 1: move all non-zero elements forward
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != 0) {
        nums[j] = nums[i];
        j++;
      }
    }

    // Step 2: fill remaining with zero
    for (int i = j; i < nums.length; i++) {
      nums[i] = 0;
    }
  }
}