class Solution {
  int minTrioDegree(int n, List<List<int>> edges) {
    List<Set<int>> graph = List.generate(n + 1, (_) => <int>{});
    List<int> degree = List.filled(n + 1, 0);

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      graph[u].add(v);
      graph[v].add(u);

      degree[u]++;
      degree[v]++;
    }

    int ans = 1 << 30;

    // Find every connected trio (a, b, c)
    for (int a = 1; a <= n; a++) {
      for (int b in graph[a]) {
        if (b <= a) continue;

        for (int c in graph[a]) {
          if (c <= b) continue;

          // a-b, a-c aur b-c hona chahiye
          if (graph[b].contains(c)) {
            int trioDegree =
                degree[a] +
                degree[b] +
                degree[c] -
                6;

            ans = ans < trioDegree ? ans : trioDegree;
          }
        }
      }
    }

    return ans == (1 << 30) ? -1 : ans;
  }
}