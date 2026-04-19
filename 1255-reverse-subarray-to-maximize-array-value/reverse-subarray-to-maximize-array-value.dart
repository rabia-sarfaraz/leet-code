class Solution {
  int maxValueAfterReverse(List<int> nums) {
    int n = nums.length;
    int total = 0;

    // Step 1: base sum
    for (int i = 0; i < n - 1; i++) {
      total += (nums[i] - nums[i + 1]).abs();
    }

    int gain = 0;

    // Step 2: edge reversals
    for (int i = 0; i < n - 1; i++) {
      gain = gain > ((nums[0] - nums[i + 1]).abs() -
              (nums[i] - nums[i + 1]).abs())
          ? gain
          : ((nums[0] - nums[i + 1]).abs() -
              (nums[i] - nums[i + 1]).abs());

      gain = gain > ((nums[n - 1] - nums[i]).abs() -
              (nums[i] - nums[i + 1]).abs())
          ? gain
          : ((nums[n - 1] - nums[i]).abs() -
              (nums[i] - nums[i + 1]).abs());
    }

    // Step 3: middle reversal
    int minMax = 1 << 30;
    int maxMin = -(1 << 30);

    for (int i = 0; i < n - 1; i++) {
      int a = nums[i];
      int b = nums[i + 1];

      minMax = minMax < (a > b ? a : b) ? minMax : (a > b ? a : b);
      maxMin = maxMin > (a < b ? a : b) ? maxMin : (a < b ? a : b);
    }

    gain = gain > (2 * (maxMin - minMax)) ? gain : (2 * (maxMin - minMax));

    return total + gain;
  }
}