import 'dart:collection';

class Solution {
  int shortestPathLength(List<List<int>> graph) {
    int n = graph.length;
    if (n == 1) return 0;

    Queue<List<int>> q = Queue();
    Set<String> visited = {};

    for (int i = 0; i < n; i++) {
      int mask = 1 << i;
      q.add([i, mask, 0]);
      visited.add("$i-$mask");
    }

    int finalMask = (1 << n) - 1;

    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int node = cur[0];
      int mask = cur[1];
      int dist = cur[2];

      if (mask == finalMask) return dist;

      for (int nei in graph[node]) {
        int newMask = mask | (1 << nei);
        String state = "$nei-$newMask";

        if (!visited.contains(state)) {
          visited.add(state);
          q.add([nei, newMask, dist + 1]);
        }
      }
    }

    return -1;
  }
}