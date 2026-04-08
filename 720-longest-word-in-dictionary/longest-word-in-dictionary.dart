class Solution {
  String longestWord(List<String> words) {
    words.sort((a, b) {
      if (a.length == b.length) return a.compareTo(b);
      return a.length - b.length;
    });

    Set<String> built = {};
    String best = "";

    for (String w in words) {
      if (w.length == 1 || built.contains(w.substring(0, w.length - 1))) {
        built.add(w);

        if (w.length > best.length ||
            (w.length == best.length && w.compareTo(best) < 0)) {
          best = w;
        }
      }
    }

    return best;
  }
}