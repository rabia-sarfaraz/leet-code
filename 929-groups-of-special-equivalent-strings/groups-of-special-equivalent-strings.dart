class Solution {
  int numSpecialEquivGroups(List<String> words) {
    Set<String> groups = {};

    for (String w in words) {
      List<String> even = [];
      List<String> odd = [];

      for (int i = 0; i < w.length; i++) {
        if (i % 2 == 0) {
          even.add(w[i]);
        } else {
          odd.add(w[i]);
        }
      }

      even.sort();
      odd.sort();

      String key = even.join('') + "|" + odd.join('');

      groups.add(key);
    }

    return groups.length;
  }
}