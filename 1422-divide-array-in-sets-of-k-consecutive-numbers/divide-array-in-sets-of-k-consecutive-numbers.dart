class Solution {
  bool isPossibleDivide(List<int> nums, int k) {
    if (nums.length % k != 0) return false;

    nums.sort();
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    for (int num in nums) {
      if (freq[num]! > 0) {
        for (int i = 0; i < k; i++) {
          int curr = num + i;

          if ((freq[curr] ?? 0) == 0) {
            return false;
          }

          freq[curr] = freq[curr]! - 1;
        }
      }
    }

    return true;
  }
}