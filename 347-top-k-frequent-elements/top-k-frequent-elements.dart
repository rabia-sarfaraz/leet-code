class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    List<int> result = freq.keys.toList();

    result.sort((a, b) => freq[b]!.compareTo(freq[a]!));

    return result.sublist(0, k);
  }
}