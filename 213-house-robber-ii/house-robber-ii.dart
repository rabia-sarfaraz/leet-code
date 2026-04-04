class Solution {
  int rob(List<int> nums) {
    if (nums.length == 1) return nums[0];

    int case1 = _robLinear(nums, 0, nums.length - 2);
    int case2 = _robLinear(nums, 1, nums.length - 1);

    return case1 > case2 ? case1 : case2;
  }

  int _robLinear(List<int> nums, int start, int end) {
    int prev2 = 0;
    int prev1 = 0;

    for (int i = start; i <= end; i++) {
      int take = prev2 + nums[i];
      int skip = prev1;

      int current = take > skip ? take : skip;

      prev2 = prev1;
      prev1 = current;
    }

    return prev1;
  }
}