class Solution {
  int hIndex(List<int> citations) {
    citations.sort();
    int n = citations.length;

    for (int i = 0; i < n; i++) {
      int h = n - i;
      if (citations[i] >= h) {
        return h;
      }
    }

    return 0;
  }
}