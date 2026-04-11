import 'dart:collection';

class Solution {
  bool possibleBipartition(int n, List<List<int>> dislikes) {
    List<List<int>> graph = List.generate(n + 1, (_) => []);

    for (var d in dislikes) {
      graph[d[0]].add(d[1]);
      graph[d[1]].add(d[0]);
    }

    List<int> color = List.filled(n + 1, 0);

    for (int i = 1; i <= n; i++) {
      if (color[i] != 0) continue;

      Queue<int> q = Queue();
      q.add(i);
      color[i] = 1;

      while (q.isNotEmpty) {
        int node = q.removeFirst();

        for (int nei in graph[node]) {
          if (color[nei] == 0) {
            color[nei] = -color[node];
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