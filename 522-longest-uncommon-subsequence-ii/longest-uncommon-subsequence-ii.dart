class Solution {
  int findLUSlength(List<String> strs) {
    strs.sort((a, b) => b.length.compareTo(a.length));

    bool isSubsequence(String a, String b) {
      int i = 0, j = 0;
      while (i < a.length && j < b.length) {
        if (a[i] == b[j]) i++;
        j++;
      }
      return i == a.length;
    }

    for (int i = 0; i < strs.length; i++) {
      bool ok = true;

      for (int j = 0; j < strs.length; j++) {
        if (i == j) continue;

        if (isSubsequence(strs[i], strs[j])) {
          ok = false;
          break;
        }
      }

      if (ok) return strs[i].length;
    }

    return -1;
  }
}