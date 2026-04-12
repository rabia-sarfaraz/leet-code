class Solution {
  int minimumDistance(String word) {
    Map<String, int> memo = {};

    // map letter -> (row, col)
    Map<String, List<int>> pos = {};
    String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    for (int i = 0; i < 26; i++) {
      pos[letters[i]] = [i ~/ 6, i % 6];
    }

    int dist(String a, String b) {
      if (a == "#") return 0;
      var p1 = pos[a]!;
      var p2 = pos[b]!;
      return (p1[0] - p2[0]).abs() + (p1[1] - p2[1]).abs();
    }

    int dfs(int i, String f1, String f2) {
      if (i == word.length) return 0;

      String key = "$i,$f1,$f2";
      if (memo.containsKey(key)) return memo[key]!;

      String c = word[i];

      // use finger1
      int cost1 = dist(f1, c) + dfs(i + 1, c, f2);

      // use finger2
      int cost2 = dist(f2, c) + dfs(i + 1, f1, c);

      int ans = cost1 < cost2 ? cost1 : cost2;

      memo[key] = ans;
      return ans;
    }

    return dfs(0, "#", "#");
  }
}