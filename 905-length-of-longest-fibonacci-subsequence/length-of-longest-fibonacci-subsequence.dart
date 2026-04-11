class Solution {
  int lenLongestFibSubseq(List<int> arr) {
    Set<int> s = arr.toSet();
    int n = arr.length;
    int maxLen = 0;

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        int a = arr[i];
        int b = arr[j];
        int len = 2;

        while (s.contains(a + b)) {
          int c = a + b;
          a = b;
          b = c;
          len++;
        }

        if (len > 2) {
          maxLen = maxLen > len ? maxLen : len;
        }
      }
    }

    return maxLen;
  }
}