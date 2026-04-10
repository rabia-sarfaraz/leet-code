class Solution {
  int uniqueLetterString(String s) {
    int n = s.length;
    Map<String, List<int>> map = {};

    // Step 1: store positions
    for (int i = 0; i < n; i++) {
      String ch = s[i];
      map.putIfAbsent(ch, () => []);
      map[ch]!.add(i);
    }

    int result = 0;

    // Step 2: calculate contribution
    for (var positions in map.values) {
      List<int> list = [-1];
      list.addAll(positions);
      list.add(n);

      for (int i = 1; i < list.length - 1; i++) {
        int prev = list[i - 1];
        int curr = list[i];
        int next = list[i + 1];

        result += (curr - prev) * (next - curr);
      }
    }

    return result;
  }
}