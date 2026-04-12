class Solution {
  int repeatedNTimes(List<int> nums) {
    Set<int> seen = {};

    for (int num in nums) {
      if (seen.contains(num)) {
        return num;
      }
      seen.add(num);
    }

    return -1; // should never happen as per constraints
  }
}