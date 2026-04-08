class Solution {
  bool checkPossibility(List<int> nums) {
    int count = 0;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] < nums[i - 1]) {
        count++;
        if (count > 1) return false;

        // decide which one to modify
        if (i - 2 < 0 || nums[i] >= nums[i - 2]) {
          nums[i - 1] = nums[i];
        } else {
          nums[i] = nums[i - 1];
        }
      }
    }

    return true;
  }
}