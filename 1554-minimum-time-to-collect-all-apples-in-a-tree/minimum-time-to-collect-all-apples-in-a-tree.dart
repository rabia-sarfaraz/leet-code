class Solution {
  int minTime(int n, List<List<int>> edges, List<bool> hasApple) {
    List<List<int>> graph = List.generate(n, (_) => []);

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      graph[u].add(v);
      graph[v].add(u);
    }

    int dfs(int node, int parent) {
      int time = 0;

      for (int nei in graph[node]) {
        if (nei == parent) continue;

        int childTime = dfs(nei, node);

        if (childTime > 0 || hasApple[nei]) {
          time += childTime + 2;
        }
      }

      return time;
    }

    return dfs(0, -1);
  }
}