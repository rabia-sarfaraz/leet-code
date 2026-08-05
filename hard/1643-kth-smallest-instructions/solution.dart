class Solution {
  String kthSmallestPath(List<int> destination, int k) {
    int v = destination[0];
    int h = destination[1];

    // Precompute combinations up to 30 (constraints)
    List<List<int>> c =
        List.generate(v + h + 1, (_) => List.filled(v + h + 1, 0));

    for (int i = 0; i <= v + h; i++) {
      c[i][0] = 1;
      c[i][i] = 1;
      for (int j = 1; j < i; j++) {
        c[i][j] = c[i - 1][j - 1] + c[i - 1][j];
      }
    }

    StringBuffer ans = StringBuffer();

    while (h > 0 || v > 0) {
      if (h == 0) {
        ans.write('V');
        v--;
      } else if (v == 0) {
        ans.write('H');
        h--;
      } else {
        int cnt = c[h + v - 1][h - 1];

        if (k <= cnt) {
          ans.write('H');
          h--;
        } else {
          ans.write('V');
          k -= cnt;
          v--;
        }
      }
    }

    return ans.toString();
  }
}