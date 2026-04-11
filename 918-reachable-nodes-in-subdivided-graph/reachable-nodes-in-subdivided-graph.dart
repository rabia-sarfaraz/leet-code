import 'package:collection/collection.dart';

class Solution {
  int reachableNodes(List<List<int>> edges, int maxMoves, int n) {
    // graph
    List<List<List<int>>> graph =
        List.generate(n, (_) => []);

    for (var e in edges) {
      int u = e[0], v = e[1], cnt = e[2];
      graph[u].add([v, cnt + 1]);
      graph[v].add([u, cnt + 1]);
    }

    // Dijkstra
    List<int> dist = List.filled(n, 1 << 60);
    dist[0] = 0;

    // ✅ FIX: use HeapPriorityQueue
    HeapPriorityQueue<List<int>> pq =
        HeapPriorityQueue((a, b) => a[0].compareTo(b[0]));

    pq.add([0, 0]); // [distance, node]

    while (pq.isNotEmpty) {
      var cur = pq.removeFirst();
      int d = cur[0], u = cur[1];

      if (d > dist[u]) continue;

      for (var nei in graph[u]) {
        int v = nei[0];
        int w = nei[1];

        if (d + w < dist[v]) {
          dist[v] = d + w;
          pq.add([dist[v], v]);
        }
      }
    }

    int result = 0;

    // count original nodes
    for (int i = 0; i < n; i++) {
      if (dist[i] <= maxMoves) result++;
    }

    // count subdivided nodes
    for (var e in edges) {
      int u = e[0], v = e[1], cnt = e[2];

      int a = dist[u] > maxMoves ? 0 : maxMoves - dist[u];
      int b = dist[v] > maxMoves ? 0 : maxMoves - dist[v];

      result += (a + b > cnt) ? cnt : (a + b);
    }

    return result;
  }
}