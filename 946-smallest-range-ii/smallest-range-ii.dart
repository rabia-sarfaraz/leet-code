class Solution {
  int smallestRangeII(List<int> nums, int k) {
    nums.sort();
    int n = nums.length;

    int ans = nums[n - 1] - nums[0];

    for (int i = 0; i < n - 1; i++) {
      int high = (nums[n - 1] - k) > (nums[i] + k)
          ? (nums[n - 1] - k)
          : (nums[i] + k);

      int low = (nums[0] + k) < (nums[i + 1] - k)
          ? (nums[0] + k)
          : (nums[i + 1] - k);

      ans = ans < (high - low) ? ans : (high - low);
    }

    return ans;
  }
}