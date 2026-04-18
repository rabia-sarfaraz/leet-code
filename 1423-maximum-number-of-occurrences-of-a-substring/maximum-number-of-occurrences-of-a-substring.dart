class Solution {
  int maxFreq(String s, int maxLetters, int minSize, int maxSize) {
    Map<String, int> freq = {};
    Map<String, int> charCount = {};

    int l = 0;
    int distinct = 0;
    int result = 0;

    for (int r = 0; r < s.length; r++) {
      charCount[s[r]] = (charCount[s[r]] ?? 0) + 1;
      if (charCount[s[r]] == 1) distinct++;

      if (r - l + 1 > minSize) {
        charCount[s[l]] = charCount[s[l]]! - 1;
        if (charCount[s[l]] == 0) {
          distinct--;
        }
        l++;
      }

      if (r - l + 1 == minSize) {
        if (distinct <= maxLetters) {
          String sub = s.substring(l, r + 1);
          freq[sub] = (freq[sub] ?? 0) + 1;
          result = result > freq[sub]! ? result : freq[sub]!;
        }
      }
    }

    return result;
  }
}