class Solution {
  int largestPerimeter(List<int> nums) {
    nums.sort();

    for (int i = nums.length - 1; i >= 2; i--) {
      int a = nums[i - 2];
      int b = nums[i - 1];
      int c = nums[i];

      if (a + b > c) {
        return a + b + c;
      }
    }

    return 0;
  }
}