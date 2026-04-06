import 'dart:math';

class Solution {
  late List<int> nums;
  Random rand = Random();

  Solution(List<int> nums) {
    this.nums = nums;
  }

  int pick(int target) {
    int result = -1;
    int count = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == target) {
        count++;
        if (rand.nextInt(count) == 0) {
          result = i;
        }
      }
    }

    return result;
  }
}