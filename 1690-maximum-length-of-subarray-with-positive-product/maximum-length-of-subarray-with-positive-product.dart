class Solution {
  int getMaxLen(List<int> nums) {
    int positive = 0;
    int negative = 0;
    int ans = 0;

    for (int x in nums) {
      if (x == 0) {
        positive = 0;
        negative = 0;
      } else if (x > 0) {
        positive = positive + 1;
        negative = negative > 0 ? negative + 1 : 0;
      } else {
        int oldPositive = positive;
        positive = negative > 0 ? negative + 1 : 0;
        negative = oldPositive + 1;
      }

      if (positive > ans) ans = positive;
    }

    return ans;
  }
}