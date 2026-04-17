class Solution {
  bool uniqueOccurrences(List<int> arr) {
    Map<int, int> freq = {};

    for (int num in arr) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    Set<int> seen = {};

    for (int count in freq.values) {
      if (seen.contains(count)) {
        return false;
      }
      seen.add(count);
    }

    return true;
  }
}