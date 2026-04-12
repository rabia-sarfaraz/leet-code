class Solution {
  bool isAlienSorted(List<String> words, String order) {
    Map<String, int> rank = {};

    // build rank map
    for (int i = 0; i < order.length; i++) {
      rank[order[i]] = i;
    }

    // compare adjacent words
    for (int i = 0; i < words.length - 1; i++) {
      String w1 = words[i];
      String w2 = words[i + 1];

      if (!inCorrectOrder(w1, w2, rank)) {
        return false;
      }
    }

    return true;
  }

  bool inCorrectOrder(String w1, String w2, Map<String, int> rank) {
    int len = w1.length < w2.length ? w1.length : w2.length;

    for (int i = 0; i < len; i++) {
      if (w1[i] != w2[i]) {
        return rank[w1[i]]! < rank[w2[i]]!;
      }
    }

    // prefix case
    return w1.length <= w2.length;
  }
}