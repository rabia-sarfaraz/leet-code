class Solution {
  int longestSubstring(String s, int k) {
    return helper(s, k, 0, s.length);
  }

  int helper(String s, int k, int start, int end) {
    if (end - start < k) return 0;

    List<int> freq = List.filled(26, 0);

    for (int i = start; i < end; i++) {
      freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    for (int i = start; i < end; i++) {
      if (freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] < k) {
        int left = helper(s, k, start, i);
        int right = helper(s, k, i + 1, end);
        return left > right ? left : right;
      }
    }

    return end - start;
  }
}