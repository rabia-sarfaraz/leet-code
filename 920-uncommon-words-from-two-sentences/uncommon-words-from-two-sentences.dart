class Solution {
  List<String> uncommonFromSentences(String s1, String s2) {
    Map<String, int> freq = {};

    List<String> words = (s1 + " " + s2).split(" ");

    for (String w in words) {
      freq[w] = (freq[w] ?? 0) + 1;
    }

    List<String> res = [];

    for (var entry in freq.entries) {
      if (entry.value == 1) {
        res.add(entry.key);
      }
    }

    return res;
  }
}