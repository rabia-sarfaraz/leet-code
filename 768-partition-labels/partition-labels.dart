class Solution {
  List<int> partitionLabels(String s) {
    Map<String, int> last = {};

    // Step 1: last occurrence store
    for (int i = 0; i < s.length; i++) {
      last[s[i]] = i;
    }

    List<int> result = [];
    int start = 0;
    int end = 0;

    // Step 2: greedy scan
    for (int i = 0; i < s.length; i++) {
      end = end > last[s[i]]! ? end : last[s[i]]!;

      if (i == end) {
        result.add(end - start + 1);
        start = i + 1;
      }
    }

    return result;
  }
}