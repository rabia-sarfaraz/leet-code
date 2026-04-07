class Solution {
  List<String> findAllConcatenatedWordsInADict(List<String> words) {
    Set<String> dict = words.toSet();
    List<String> result = [];

    for (String word in words) {
      dict.remove(word);

      if (word.isNotEmpty && canForm(word, dict)) {
        result.add(word);
      }

      dict.add(word);
    }

    return result;
  }

  bool canForm(String word, Set<String> dict) {
    int n = word.length;
    List<bool> dp = List.filled(n + 1, false);
    dp[0] = true;

    for (int i = 1; i <= n; i++) {
      for (int j = 0; j < i; j++) {
        if (dp[j] && dict.contains(word.substring(j, i))) {
          dp[i] = true;
          break;
        }
      }
    }

    return dp[n];
  }
}