class Solution {
  List<String> spellchecker(List<String> wordlist, List<String> queries) {
    Set<String> exact = {};
    Map<String, String> caseMap = {};
    Map<String, String> vowelMap = {};

    String devowel(String w) {
      String lower = w.toLowerCase();
      StringBuffer sb = StringBuffer();

      for (int i = 0; i < lower.length; i++) {
        String c = lower[i];
        if ("aeiou".contains(c)) {
          sb.write("*");
        } else {
          sb.write(c);
        }
      }

      return sb.toString();
    }

    for (String w in wordlist) {
      exact.add(w);

      String lower = w.toLowerCase();
      if (!caseMap.containsKey(lower)) {
        caseMap[lower] = w;
      }

      String v = devowel(w);
      if (!vowelMap.containsKey(v)) {
        vowelMap[v] = w;
      }
    }

    List<String> res = [];

    for (String q in queries) {
      if (exact.contains(q)) {
        res.add(q);
        continue;
      }

      String lowerQ = q.toLowerCase();
      if (caseMap.containsKey(lowerQ)) {
        res.add(caseMap[lowerQ]!);
        continue;
      }

      String vq = devowel(q);
      if (vowelMap.containsKey(vq)) {
        res.add(vowelMap[vq]!);
        continue;
      }

      res.add("");
    }

    return res;
  }
}