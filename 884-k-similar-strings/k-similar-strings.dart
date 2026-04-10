class Solution {
  int kSimilarity(String s1, String s2) {
    if (s1 == s2) return 0;

    var q = <List<dynamic>>[];
    Set<String> visited = {};

    q.add([s1, 0]);
    visited.add(s1);

    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      String s = cur[0];
      int steps = cur[1];

      if (s == s2) return steps;

      int i = 0;
      while (i < s.length && s[i] == s2[i]) {
        i++;
      }

      for (int j = i + 1; j < s.length; j++) {
        if (s[j] == s2[i] && s[j] != s2[j]) {
          String newStr = swap(s, i, j);

          if (!visited.contains(newStr)) {
            visited.add(newStr);
            q.add([newStr, steps + 1]);
          }
        }
      }
    }

    return 0;
  }

  String swap(String s, int i, int j) {
    List<String> arr = s.split('');

    String temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;

    return arr.join();
  }
}