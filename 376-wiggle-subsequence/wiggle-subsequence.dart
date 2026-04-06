class Solution {
  int wiggleMaxLength(List<int> nums) {
    if (nums.isEmpty) return 0;

    int up = 1;
    int down = 1;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        up = down + 1;
      } else if (nums[i] < nums[i - 1]) {
        down = up + 1;
      }
    }

    return up > down ? up : down;
  }
}