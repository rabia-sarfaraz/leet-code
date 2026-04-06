class Solution {
  int longestPalindrome(String s) {
    Map<String, int> freq = {};

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];
      freq[ch] = (freq[ch] ?? 0) + 1;
    }

    int length = 0;
    bool hasOdd = false;

    for (int count in freq.values) {
      if (count % 2 == 0) {
        length += count;
      } else {
        length += count - 1;
        hasOdd = true;
      }
    }

    if (hasOdd) length += 1;

    return length;
  }
}