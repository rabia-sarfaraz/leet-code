class Solution {
  int minSetSize(List<int> arr) {
    Map<int, int> freq = {};

    // Step 1: count frequency
    for (int num in arr) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    // Step 2: sort frequencies (descending)
    List<int> counts = freq.values.toList();
    counts.sort((a, b) => b.compareTo(a));

    // Step 3: remove largest frequencies
    int removed = 0;
    int size = 0;
    int half = arr.length ~/ 2;

    for (int c in counts) {
      removed += c;
      size++;

      if (removed >= half) {
        return size;
      }
    }

    return size;
  }
}