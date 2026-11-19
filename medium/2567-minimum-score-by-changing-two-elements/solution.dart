import 'dart:math';

class Solution {
  int minimizeSum(List<int> nums) {
    int n = nums.length;
    if (n <= 3) return 0;

    nums.sort();

    int option1 = nums[n - 1] - nums[2]; // 2 smallest badle
    int option2 = nums[n - 2] - nums[1]; // 1 smallest aur 1 largest badla
    int option3 = nums[n - 3] - nums[0]; // 2 largest badle

    return min(option1, min(option2, option3));
  }
}