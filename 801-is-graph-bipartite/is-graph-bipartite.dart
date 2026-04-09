import 'dart:collection';

class Solution {
  bool isBipartite(List<List<int>> graph) {
    int n = graph.length;
    List<int> color = List.filled(n, -1);

    for (int i = 0; i < n; i++) {
      if (color[i] != -1) continue;

      Queue<int> q = Queue();
      q.add(i);
      color[i] = 0;

      while (q.isNotEmpty) {
        int node = q.removeFirst();

        for (int nei in graph[node]) {
          if (color[nei] == -1) {
            color[nei] = 1 - color[node];
            q.add(nei);
          } else if (color[nei] == color[node]) {
            return false;
          }
        }
      }
    }

    return true;
  }
}