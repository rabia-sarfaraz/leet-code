class Solution {
  int minDeletions(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }

    Set<int> used = {};
    int deletions = 0;

    for (int f in freq) {
      while (f > 0 && used.contains(f)) {
        f--;
        deletions++;
      }
      if (f > 0) {
        used.add(f);
      }
    }

    return deletions;
  }
}