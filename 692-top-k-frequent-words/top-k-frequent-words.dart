class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    Map<String, int> freq = {};

    for (String w in words) {
      freq[w] = (freq[w] ?? 0) + 1;
    }

    List<String> list = freq.keys.toList();

    list.sort((a, b) {
      if (freq[b] != freq[a]) {
        return freq[b]!.compareTo(freq[a]!); // higher freq first
      }
      return a.compareTo(b); // lexicographically smaller first
    });

    return list.sublist(0, k);
  }
}