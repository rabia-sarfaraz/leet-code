class Solution {
  List<int> gardenNoAdj(int n, List<List<int>> paths) {
    List<List<int>> graph = List.generate(n, (_) => []);
    List<int> res = List.filled(n, 0);

    // build graph
    for (var p in paths) {
      int u = p[0] - 1;
      int v = p[1] - 1;
      graph[u].add(v);
      graph[v].add(u);
    }

    for (int i = 0; i < n; i++) {
      Set<int> used = {};

      for (int nei in graph[i]) {
        if (res[nei] != 0) {
          used.add(res[nei]);
        }
      }

      for (int c = 1; c <= 4; c++) {
        if (!used.contains(c)) {
          res[i] = c;
          break;
        }
      }
    }

    return res;
  }
}