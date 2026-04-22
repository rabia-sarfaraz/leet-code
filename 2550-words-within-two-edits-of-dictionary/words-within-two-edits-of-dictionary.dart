class Solution {
  List<String> twoEditWords(List<String> queries, List<String> dictionary) {
    List<String> result = [];

    for (String q in queries) {
      for (String d in dictionary) {
        int diff = 0;

        for (int i = 0; i < q.length; i++) {
          if (q[i] != d[i]) {
            diff++;
            if (diff > 2) break;
          }
        }

        if (diff <= 2) {
          result.add(q);
          break; // ek match mil gaya
        }
      }
    }

    return result;
  }
}