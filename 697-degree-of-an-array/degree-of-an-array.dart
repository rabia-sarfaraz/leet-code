class Solution {
  int findShortestSubArray(List<int> nums) {
    Map<int, int> freq = {};
    Map<int, int> first = {};
    Map<int, int> last = {};

    for (int i = 0; i < nums.length; i++) {
      int x = nums[i];

      freq[x] = (freq[x] ?? 0) + 1;

      if (!first.containsKey(x)) {
        first[x] = i;
      }

      last[x] = i;
    }

    int degree = 0;

    for (var v in freq.values) {
      if (v > degree) degree = v;
    }

    int ans = nums.length;

    for (var key in freq.keys) {
      if (freq[key] == degree) {
        int len = last[key]! - first[key]! + 1;
        if (len < ans) ans = len;
      }
    }

    return ans;
  }
}