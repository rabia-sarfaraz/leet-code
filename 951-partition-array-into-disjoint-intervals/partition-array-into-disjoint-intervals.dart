class Solution {
  int partitionDisjoint(List<int> nums) {
    int leftMax = nums[0];
    int currentMax = nums[0];
    int partitionIdx = 0;

    for (int i = 1; i < nums.length; i++) {
      currentMax = currentMax > nums[i] ? currentMax : nums[i];

      if (nums[i] < leftMax) {
        partitionIdx = i;
        leftMax = currentMax;
      }
    }

    return partitionIdx + 1;
  }
}