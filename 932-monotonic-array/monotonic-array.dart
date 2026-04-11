class Solution {
  bool isMonotonic(List<int> nums) {
    bool inc = true;
    bool dec = true;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        dec = false;
      }
      if (nums[i] < nums[i - 1]) {
        inc = false;
      }
    }

    return inc || dec;
  }
}