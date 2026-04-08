class WordFilter {
  Map<String, int> map = {};

  WordFilter(List<String> words) {
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      int n = word.length;

      for (int p = 0; p <= n; p++) {
        String prefix = word.substring(0, p);

        for (int s = 0; s <= n; s++) {
          String suffix = word.substring(s);

          String key = prefix + "#" + suffix;
          map[key] = i; // keep highest index
        }
      }
    }
  }

  int f(String pref, String suff) {
    return map[pref + "#" + suff] ?? -1;
  }
}