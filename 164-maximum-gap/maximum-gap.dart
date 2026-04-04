class Solution {
  int maximumGap(List<int> nums) {
    if (nums.length < 2) return 0;

    nums.sort();

    int maxGap = 0;

    for (int i = 1; i < nums.length; i++) {
      maxGap = maxGap > (nums[i] - nums[i - 1])
          ? maxGap
          : (nums[i] - nums[i - 1]);
    }

    return maxGap;
  }
}