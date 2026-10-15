
class Solution {
  int sumCounts(List<int> nums) {
    int n = nums.length;
    int result = 0;

    for (int i = 0; i < n; i++) {
      Set<int> distinct = {};

      for (int j = i; j < n; j++) {
        distinct.add(nums[j]);

        int count = distinct.length;
        result += count * count;
      }
    }

    return result;
  }
}
