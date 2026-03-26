class Solution {
  bool canJump(List<int> nums) {
    int maxReach = 0;

    for (int i = 0; i < nums.length; i++) {
      if (i > maxReach) return false;

      maxReach = (i + nums[i] > maxReach) ? i + nums[i] : maxReach;
    }

    return true;
  }
}