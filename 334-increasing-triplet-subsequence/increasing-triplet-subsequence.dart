class Solution {
  bool increasingTriplet(List<int> nums) {
    int first = 1 << 31; // very large value (safe max int)
    int second = 1 << 31;

    for (int num in nums) {
      if (num <= first) {
        first = num;
      } else if (num <= second) {
        second = num;
      } else {
        return true;
      }
    }

    return false;
  }
}