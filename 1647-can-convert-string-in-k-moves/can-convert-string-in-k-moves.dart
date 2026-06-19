class Solution {
  bool canConvertString(String s, String t, int k) {
    if (s.length != t.length) return false;

    List<int> cnt = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      int diff =
          (t.codeUnitAt(i) - s.codeUnitAt(i) + 26) % 26;

      if (diff == 0) continue;

      int move = diff + 26 * cnt[diff];
      if (move > k) return false;

      cnt[diff]++;
    }

    return true;
  }
}