class Solution {
  int findPairs(List<int> nums, int k) {
    if (k < 0) return 0;

    Map<int, int> freq = {};
    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    int count = 0;

    if (k == 0) {
      for (int val in freq.values) {
        if (val > 1) count++;
      }
      return count;
    }

    for (int key in freq.keys) {
      if (freq.containsKey(key + k)) {
        count++;
      }
    }

    return count;
  }
}