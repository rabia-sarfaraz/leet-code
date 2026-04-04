class Solution {
  void rotate(List<int> nums, int k) {
    int n = nums.length;
    if (n == 0) return;

    k = k % n;

    _reverse(nums, 0, n - 1);
    _reverse(nums, 0, k - 1);
    _reverse(nums, k, n - 1);
  }

  void _reverse(List<int> nums, int l, int r) {
    while (l < r) {
      int temp = nums[l];
      nums[l] = nums[r];
      nums[r] = temp;
      l++;
      r--;
    }
  }
}