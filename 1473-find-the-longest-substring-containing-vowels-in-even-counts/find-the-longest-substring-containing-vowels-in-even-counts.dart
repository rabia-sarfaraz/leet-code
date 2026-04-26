class Solution {
  int findTheLongestSubstring(String s) {
    Map<String, int> vowelBit = {
      'a': 0,
      'e': 1,
      'i': 2,
      'o': 3,
      'u': 4,
    };

    Map<int, int> firstSeen = {0: -1};

    int mask = 0;
    int ans = 0;

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (vowelBit.containsKey(ch)) {
        mask ^= (1 << vowelBit[ch]!);
      }

      if (firstSeen.containsKey(mask)) {
        ans = ans > i - firstSeen[mask]!
            ? ans
            : i - firstSeen[mask]!;
      } else {
        firstSeen[mask] = i;
      }
    }

    return ans;
  }
}