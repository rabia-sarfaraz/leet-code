class Solution {
  int minIncrementForUnique(List<int> nums) {
    nums.sort();
    
    int moves = 0;
    int prev = nums[0];

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] <= prev) {
        prev = prev + 1;
        moves += prev - nums[i];
      } else {
        prev = nums[i];
      }
    }

    return moves;
  }
}