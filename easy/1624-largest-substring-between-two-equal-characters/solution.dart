class Solution {
  int maxLengthBetweenEqualCharacters(String s) {
    Map<String, int> first = {};
    int ans = -1;

    for (int i = 0; i < s.length; i++) {
      if (!first.containsKey(s[i])) {
        first[s[i]] = i;
      } else {
        ans = ans > (i - first[s[i]]! - 1)
            ? ans
            : (i - first[s[i]]! - 1);
      }
    }

    return ans;
  }
}