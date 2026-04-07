class Solution {
  int minMoves2(List<int> nums) {
    nums.sort();

    int n = nums.length;
    int median = nums[n ~/ 2];

    int moves = 0;

    for (int num in nums) {
      moves += (num - median).abs();
    }

    return moves;
  }
}