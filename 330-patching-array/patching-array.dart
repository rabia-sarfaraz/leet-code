class Solution {
  int minPatches(List<int> nums, int n) {
    int i = 0;
    int patches = 0;
    int miss = 1;
    int len = nums.length;

    while (miss <= n) {
      if (i < len && nums[i] <= miss) {
        miss += nums[i];
        i++;
      } else {
        miss += miss;
        patches++;
      }
    }

    return patches;
  }
}