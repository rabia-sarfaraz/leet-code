class Solution {
  List<int> findSubstring(String s, List<String> words) {
    if (s.isEmpty || words.isEmpty) return [];

    int wordLen = words[0].length;
    int wordCount = words.length;
    int totalLen = wordLen * wordCount;

    Map<String, int> wordMap = {};
    for (var word in words) {
      wordMap[word] = (wordMap[word] ?? 0) + 1;
    }

    List<int> result = [];

    for (int i = 0; i <= s.length - totalLen; i++) {
      Map<String, int> seen = {};
      int j = 0;

      while (j < wordCount) {
        int start = i + j * wordLen;
        String word = s.substring(start, start + wordLen);

        if (!wordMap.containsKey(word)) break;

        seen[word] = (seen[word] ?? 0) + 1;

        if (seen[word]! > wordMap[word]!) break;

        j++;
      }

      if (j == wordCount) {
        result.add(i);
      }
    }

    return result;
  }
}