class Solution {
  String orderlyQueue(String s, int k) {
    if (k > 1) {
      List<String> chars = s.split('');
      chars.sort();
      return chars.join('');
    }

    String best = s;
    String cur = s;

    for (int i = 1; i < s.length; i++) {
      cur = cur.substring(1) + cur[0];
      if (cur.compareTo(best) < 0) {
        best = cur;
      }
    }

    return best;
  }
}