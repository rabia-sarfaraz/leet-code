class Solution {
  int dominantIndex(List<int> nums) {
    int maxVal = -1;
    int maxIndex = -1;
    int secondMax = -1;

    for (int i = 0; i < nums.length; i++) {
      int val = nums[i];

      if (val > maxVal) {
        secondMax = maxVal;
        maxVal = val;
        maxIndex = i;
      } else if (val > secondMax) {
        secondMax = val;
      }
    }

    if (maxVal >= 2 * (secondMax < 0 ? 0 : secondMax)) {
      return maxIndex;
    }

    return -1;
  }
}