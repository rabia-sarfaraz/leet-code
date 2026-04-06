class Solution {
  int numberOfArithmeticSlices(List<int> nums) {
    int n = nums.length;

    // If less than 3 elements, no arithmetic slice possible
    if (n < 3) return 0;

    int curr = 0;   // current count of arithmetic slices ending at index i
    int total = 0;  // total arithmetic slices

    for (int i = 2; i < n; i++) {
      // check if current 3 numbers form arithmetic sequence
      if (nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2]) {
        curr = curr + 1;
        total = total + curr;
      } else {
        curr = 0;
      }
    }

    return total;
  }
}