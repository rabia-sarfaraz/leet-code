class Solution {
  int numMatchingSubseq(String s, List<String> words) {
    Map<String, List<int>> pos = {};

    // store indices of each character in s
    for (int i = 0; i < s.length; i++) {
      pos.putIfAbsent(s[i], () => []).add(i);
    }

    bool isSubsequence(String word) {
      int prev = -1;

      for (int i = 0; i < word.length; i++) {
        String ch = word[i];
        if (!pos.containsKey(ch)) return false;

        List<int> list = pos[ch]!;

        // binary search for next greater index
        int l = 0, r = list.length - 1;
        int idx = -1;

        while (l <= r) {
          int mid = (l + r) ~/ 2;
          if (list[mid] > prev) {
            idx = list[mid];
            r = mid - 1;
          } else {
            l = mid + 1;
          }
        }

        if (idx == -1) return false;
        prev = idx;
      }

      return true;
    }

    int count = 0;

    for (var w in words) {
      if (isSubsequence(w)) count++;
    }

    return count;
  }
}