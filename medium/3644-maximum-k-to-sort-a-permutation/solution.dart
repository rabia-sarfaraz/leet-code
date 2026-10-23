class Solution {
  int sortPermutation(List<int> nums) {
    int ans = (1 << 30) - 1;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != i) {
        ans &= nums[i];
      }
    }

    return ans == (1 << 30) - 1 ? 0 : ans;
  }
}