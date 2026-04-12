class Solution {
  int maxWidthRamp(List<int> nums) {
    int n = nums.length;
    List<int> stack = [];

    // Step 1: build decreasing stack of indices
    for (int i = 0; i < n; i++) {
      if (stack.isEmpty || nums[i] < nums[stack.last]) {
        stack.add(i);
      }
    }

    int res = 0;

    // Step 2: scan from right
    for (int j = n - 1; j >= 0; j--) {
      while (stack.isNotEmpty && nums[stack.last] <= nums[j]) {
        res = res > (j - stack.last) ? res : (j - stack.last);
        stack.removeLast();
      }
    }

    return res;
  }
}