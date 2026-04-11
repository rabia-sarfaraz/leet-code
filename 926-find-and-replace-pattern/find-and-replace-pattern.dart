class Solution {
  List<String> findAndReplacePattern(List<String> words, String pattern) {
    String p = encode(pattern);

    List<String> res = [];

    for (String w in words) {
      if (encode(w) == p) {
        res.add(w);
      }
    }

    return res;
  }

  String encode(String s) {
    Map<String, int> map = {};
    int id = 0;

    List<int> res = [];

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (!map.containsKey(c)) {
        map[c] = id++;
      }

      res.add(map[c]!);
    }

    return res.join(',');
  }
}