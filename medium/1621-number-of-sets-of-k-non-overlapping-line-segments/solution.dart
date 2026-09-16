class Solution {
  int numberOfSets(int n, int k) {
    const int MOD = 1000000007;

    // f = currently no segment is being drawn
    // g = currently inside a segment
    List<int> f = List.filled(k + 1, 0);
    List<int> g = List.filled(k + 1, 0);

    // Before processing points:
    // 0 segments completed = 1 way
    f[0] = 1;

    for (int i = 2; i <= n; i++) {
      List<int> newF = List.filled(k + 1, 0);
      List<int> newG = List.filled(k + 1, 0);

      for (int j = 0; j <= k; j++) {
        // Don't draw a segment at this point
        newF[j] = (f[j] + g[j]) % MOD;

        // Continue an existing segment
        newG[j] = g[j];

        if (j > 0) {
          // Start a new segment
          newG[j] = (newG[j] + f[j - 1]) % MOD;

          // Finish current segment and start/continue appropriately
          newG[j] = (newG[j] + g[j - 1]) % MOD;
        }
      }

      f = newF;
      g = newG;
    }

    return (f[k] + g[k]) % MOD;
  }
}