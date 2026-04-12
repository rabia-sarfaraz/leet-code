class Solution {
  bool canReorderDoubled(List<int> arr) {
    Map<int, int> freq = {};

    // frequency map
    for (int x in arr) {
      freq[x] = (freq[x] ?? 0) + 1;
    }

    // sort by absolute value
    arr.sort((a, b) => a.abs().compareTo(b.abs()));

    for (int x in arr) {
      if ((freq[x] ?? 0) == 0) continue;

      int want = 2 * x;

      if ((freq[want] ?? 0) == 0) {
        return false;
      }

      freq[x] = freq[x]! - 1;
      freq[want] = freq[want]! - 1;
    }

    return true;
  }
}