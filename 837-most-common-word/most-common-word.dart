class Solution {
  String mostCommonWord(String paragraph, List<String> banned) {
    Set<String> bannedSet = banned.toSet();

    // clean + lowercase
    String cleaned = paragraph.toLowerCase().replaceAll(RegExp(r'[^a-z]'), ' ');

    List<String> words = cleaned.split(RegExp(r'\s+'));

    Map<String, int> count = {};
    String result = "";
    int maxFreq = 0;

    for (String word in words) {
      if (word.isEmpty || bannedSet.contains(word)) continue;

      count[word] = (count[word] ?? 0) + 1;

      if (count[word]! > maxFreq) {
        maxFreq = count[word]!;
        result = word;
      }
    }

    return result;
  }
}