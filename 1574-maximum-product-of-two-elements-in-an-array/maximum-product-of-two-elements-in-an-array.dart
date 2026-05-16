class Solution {
  int maxProduct(List<int> nums) {
    nums.sort();

    int n = nums.length;

    return (nums[n - 1] - 1) * (nums[n - 2] - 1);
  }
}