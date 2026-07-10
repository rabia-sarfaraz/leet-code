class Solution {
  List<int> pathExistenceQueries(int n, List<int> nums, int maxDiff, List<List<int>> queries) {
    // 1) Indices ko value ke hisaab se sort karo
    List<int> order = List<int>.generate(n, (i) => i);
    order.sort((a, b) => nums[a].compareTo(nums[b]));

    List<int> pos = List<int>.filled(n, 0);       // pos[originalIndex] = sorted rank
    List<int> sortedVal = List<int>.filled(n, 0);
    for (int r = 0; r < n; r++) {
      pos[order[r]] = r;
      sortedVal[r] = nums[order[r]];
    }

    // 2) Connected components — sorted order me consecutive gap check
    List<int> comp = List<int>.filled(n, 0);
    for (int r = 1; r < n; r++) {
      comp[r] = (sortedVal[r] - sortedVal[r - 1] <= maxDiff) ? comp[r - 1] : comp[r - 1] + 1;
    }

    // 3) far[r] = sorted-rank space me sabse door direct-reachable rank
    List<int> far = List<int>.filled(n, 0);
    int r2 = 0;
    for (int r = 0; r < n; r++) {
      if (r2 < r) r2 = r;
      while (r2 + 1 < n && sortedVal[r2 + 1] - sortedVal[r] <= maxDiff) r2++;
      far[r] = r2;
    }

    // 4) Binary lifting table
    int LOG = 1;
    while ((1 << LOG) < n) LOG++;
    LOG += 1;
    List<List<int>> up = List.generate(LOG, (_) => List<int>.filled(n, 0));
    for (int i = 0; i < n; i++) up[0][i] = far[i];
    for (int k = 1; k < LOG; k++) {
      for (int i = 0; i < n; i++) {
        up[k][i] = up[k - 1][up[k - 1][i]];
      }
    }

    // 5) Queries answer karo — original index ko sorted rank me convert karke
    List<int> ans = List<int>.filled(queries.length, -1);
    for (int qi = 0; qi < queries.length; qi++) {
      int ru = pos[queries[qi][0]];
      int rv = pos[queries[qi][1]];
      if (ru > rv) { final t = ru; ru = rv; rv = t; }
      if (ru == rv) { ans[qi] = 0; continue; }
      if (comp[ru] != comp[rv]) { ans[qi] = -1; continue; }

      int cur = ru, steps = 0;
      for (int k = LOG - 1; k >= 0; k--) {
        if (up[k][cur] < rv) {
          steps += (1 << k);
          cur = up[k][cur];
        }
      }
      ans[qi] = steps + 1;
    }

    return ans;
  }
}