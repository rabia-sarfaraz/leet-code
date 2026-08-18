class Solution {
  int largestInteger(List<int> nums, int k) {
    Map<int, int> count = {};

    for (int i = 0; i <= nums.length - k; i++) {
      Set<int> seen = {};

      for (int j = i; j < i + k; j++) {
        seen.add(nums[j]);
      }

      for (int x in seen) {
        count[x] = (count[x] ?? 0) + 1;
      }
    }

    int ans = -1;

    for (int x in count.keys) {
      if (count[x] == 1) {
        ans = ans > x ? ans : x;
      }
    }

    return ans;
  }
}