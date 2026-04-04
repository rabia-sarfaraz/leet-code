class Solution {
  int rob(List<int> nums) {
    if (nums.isEmpty) return 0;
    if (nums.length == 1) return nums[0];

    int prev2 = nums[0];
    int prev1 = nums[0];

    for (int i = 1; i < nums.length; i++) {
      int take = nums[i] + (i > 1 ? prev2 : 0);
      int skip = prev1;

      int curr = take > skip ? take : skip;

      prev2 = prev1;
      prev1 = curr;
    }

    return prev1;
  }
}