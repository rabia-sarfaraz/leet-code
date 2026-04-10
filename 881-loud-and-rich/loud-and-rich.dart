class Solution {
  List<int> loudAndRich(List<List<int>> richer, List<int> quiet) {
    int n = quiet.length;

    List<List<int>> graph = List.generate(n, (_) => []);
    List<int> ans = List.generate(n, (i) => i);
    List<bool> visited = List.filled(n, false);

    // build graph: b -> a
    for (var r in richer) {
      graph[r[1]].add(r[0]);
    }

    int dfs(int u) {
      if (visited[u]) return ans[u];

      visited[u] = true;
      int best = u;

      for (int v in graph[u]) {
        int cand = dfs(v);
        if (quiet[cand] < quiet[best]) {
          best = cand;
        }
      }

      ans[u] = best;
      return best;
    }

    for (int i = 0; i < n; i++) {
      dfs(i);
    }

    return ans;
  }
}