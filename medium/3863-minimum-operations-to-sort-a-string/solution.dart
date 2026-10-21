class Solution {
  int minOperations(String s) {
    int n = s.length;
    bool sorted = true;

    for (int i = 1; i < n; i++) {
      if (s[i].compareTo(s[i - 1]) < 0) {
        sorted = false;
        break;
      }
    }

    if (sorted) return 0;
    if (n == 2) return -1;

    String minChar = s[0];
    String maxChar = s[0];

    for (int i = 1; i < n; i++) {
      if (s[i].compareTo(minChar) < 0) {
        minChar = s[i];
      }

      if (s[i].compareTo(maxChar) > 0) {
        maxChar = s[i];
      }
    }

    if (s[0] == minChar || s[n - 1] == maxChar) {
      return 1;
    }

    for (int i = 1; i < n - 1; i++) {
      if (s[i] == minChar || s[i] == maxChar) {
        return 2;
      }
    }

    return 3;
  }
}