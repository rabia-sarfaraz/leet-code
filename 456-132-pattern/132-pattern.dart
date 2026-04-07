class Solution {
  bool find132pattern(List<int> nums) {
    int n = nums.length;
    if (n < 3) return false;

    List<int> stack = [];
    int third = -1 << 31; // -infinity

    for (int i = n - 1; i >= 0; i--) {
      if (nums[i] < third) return true;

      while (stack.isNotEmpty && nums[i] > stack.last) {
        third = stack.removeLast();
      }

      stack.add(nums[i]);
    }

    return false;
  }
}