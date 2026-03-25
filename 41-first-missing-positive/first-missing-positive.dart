class Solution {
  int firstMissingPositive(List<int> nums) {
    int n = nums.length;

    int i = 0;
    while (i < n) {
      int correctIndex = nums[i] - 1;

      if (nums[i] > 0 &&
          nums[i] <= n &&
          nums[i] != nums[correctIndex]) {
        // swap
        int temp = nums[i];
        nums[i] = nums[correctIndex];
        nums[correctIndex] = temp;
      } else {
        i++;
      }
    }

    // find first missing
    for (int i = 0; i < n; i++) {
      if (nums[i] != i + 1) {
        return i + 1;
      }
    }

    return n + 1;
  }
}