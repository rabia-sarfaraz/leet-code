class Solution {
  List<String> wordBreak(String s, List<String> wordDict) {
    Set<String> dict = wordDict.toSet();
    Map<int, List<String>> memo = {};

    List<String> dfs(int start) {
      if (memo.containsKey(start)) return memo[start]!;

      List<String> result = [];

      if (start == s.length) {
        result.add(""); // base case
        return result;
      }

      for (int end = start + 1; end <= s.length; end++) {
        String word = s.substring(start, end);

        if (dict.contains(word)) {
          List<String> subList = dfs(end);

          for (String sub in subList) {
            if (sub.isEmpty) {
              result.add(word);
            } else {
              result.add("$word $sub");
            }
          }
        }
      }

      memo[start] = result;
      return result;
    }

    return dfs(0);
  }
}