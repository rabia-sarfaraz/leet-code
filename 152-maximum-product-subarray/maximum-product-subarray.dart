class Solution {
  int maxProduct(List<int> nums) {
    int maxSoFar = nums[0];
    int minSoFar = nums[0];
    int result = nums[0];

    for (int i = 1; i < nums.length; i++) {
      int num = nums[i];

      if (num < 0) {
        int temp = maxSoFar;
        maxSoFar = minSoFar;
        minSoFar = temp;
      }

      maxSoFar = (num > num * maxSoFar) ? num : num * maxSoFar;
      minSoFar = (num < num * minSoFar) ? num : num * minSoFar;

      result = result > maxSoFar ? result : maxSoFar;
    }

    return result;
  }
}