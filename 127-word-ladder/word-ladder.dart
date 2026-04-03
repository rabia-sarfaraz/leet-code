class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    Set<String> wordSet = Set.from(wordList);
    if (!wordSet.contains(endWord)) return 0;

    // 🔥 pattern map: h*t -> hot, dot etc
    Map<String, List<String>> patternMap = {};

    for (String word in wordSet) {
      for (int i = 0; i < word.length; i++) {
        String pattern =
            word.substring(0, i) + '*' + word.substring(i + 1);
        patternMap.putIfAbsent(pattern, () => []);
        patternMap[pattern]!.add(word);
      }
    }

    List<String> queue = [beginWord];
    Set<String> visited = {beginWord};
    int steps = 1;

    while (queue.isNotEmpty) {
      int size = queue.length;

      for (int s = 0; s < size; s++) {
        String word = queue.removeAt(0);

        if (word == endWord) return steps;

        for (int i = 0; i < word.length; i++) {
          String pattern =
              word.substring(0, i) + '*' + word.substring(i + 1);

          if (!patternMap.containsKey(pattern)) continue;

          for (String next in patternMap[pattern]!) {
            if (visited.contains(next)) continue;

            visited.add(next);
            queue.add(next);
          }
        }
      }

      steps++;
    }

    return 0;
  }
}