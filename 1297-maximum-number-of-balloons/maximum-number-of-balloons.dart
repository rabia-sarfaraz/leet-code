class Solution {
  int maxNumberOfBalloons(String text) {
    Map<String, int> freq = {};

    for (int i = 0; i < text.length; i++) {
      String ch = text[i];
      freq[ch] = (freq[ch] ?? 0) + 1;
    }

    int b = freq['b'] ?? 0;
    int a = freq['a'] ?? 0;
    int l = freq['l'] ?? 0;
    int o = freq['o'] ?? 0;
    int n = freq['n'] ?? 0;

    return [
      b,
      a,
      l ~/ 2,
      o ~/ 2,
      n
    ].reduce((a, b) => a < b ? a : b);
  }
}