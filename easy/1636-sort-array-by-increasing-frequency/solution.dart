class Solution {
  List<int> frequencySort(List<int> nums) {
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    nums.sort((a, b) {
      if (freq[a] != freq[b]) {
        return freq[a]! - freq[b]!;
      }
      return b - a;
    });

    return nums;
  }
}