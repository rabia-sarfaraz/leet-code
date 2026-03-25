class Solution {
  int jump(List<int> nums) {
    int jumps = 0;
    int currentEnd = 0;
    int farthest = 0;

    for (int i = 0; i < nums.length - 1; i++) {
      farthest = (i + nums[i] > farthest) ? i + nums[i] : farthest;

      if (i == currentEnd) {
        jumps++;
        currentEnd = farthest;
      }
    }

    return jumps;
  }
}