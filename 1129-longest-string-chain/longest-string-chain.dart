class Solution {
  int longestStrChain(List<String> words) {
    words.sort((a, b) => a.length.compareTo(b.length));

    Map<String, int> dp = {};
    int res = 1;

    for (String word in words) {
      int best = 1;

      for (int i = 0; i < word.length; i++) {
        String prev = word.substring(0, i) + word.substring(i + 1);

        if (dp.containsKey(prev)) {
          best = best > dp[prev]! + 1 ? best : dp[prev]! + 1;
        }
      }

      dp[word] = best;
      res = res > best ? res : best;
    }

    return res;
  }
}