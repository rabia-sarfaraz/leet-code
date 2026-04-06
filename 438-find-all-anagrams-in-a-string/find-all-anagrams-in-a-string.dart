class Solution {
  List<int> findAnagrams(String s, String p) {
    List<int> result = [];

    if (s.length < p.length) return result;

    List<int> pCount = List.filled(26, 0);
    List<int> windowCount = List.filled(26, 0);

    int aCode = 'a'.codeUnitAt(0);

    for (int i = 0; i < p.length; i++) {
      pCount[p.codeUnitAt(i) - aCode]++;
      windowCount[s.codeUnitAt(i) - aCode]++;
    }

    bool matches(List<int> a, List<int> b) {
      for (int i = 0; i < 26; i++) {
        if (a[i] != b[i]) return false;
      }
      return true;
    }

    if (matches(pCount, windowCount)) {
      result.add(0);
    }

    for (int i = p.length; i < s.length; i++) {
      windowCount[s.codeUnitAt(i) - aCode]++;
      windowCount[s.codeUnitAt(i - p.length) - aCode]--;

      if (matches(pCount, windowCount)) {
        result.add(i - p.length + 1);
      }
    }

    return result;
  }
}