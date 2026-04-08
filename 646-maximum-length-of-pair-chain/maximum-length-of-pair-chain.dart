class Solution {
  int findLongestChain(List<List<int>> pairs) {
    pairs.sort((a, b) => a[1].compareTo(b[1]));

    int count = 0;
    int currentEnd = -1000000000;

    for (var pair in pairs) {
      if (pair[0] > currentEnd) {
        count++;
        currentEnd = pair[1];
      }
    }

    return count;
  }
}