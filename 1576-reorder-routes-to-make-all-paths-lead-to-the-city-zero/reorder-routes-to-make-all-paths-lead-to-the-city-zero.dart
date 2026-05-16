class Solution {
  int minReorder(int n, List<List<int>> connections) {

    // graph[node] = [neighbor, needsReversal]
    List<List<List<int>>> graph =
        List.generate(n, (_) => []);

    for (var edge in connections) {
      int a = edge[0];
      int b = edge[1];

      // original edge a -> b
      graph[a].add([b, 1]);

      // reverse helper edge
      graph[b].add([a, 0]);
    }

    List<bool> visited = List.filled(n, false);

    int changes = 0;

    List<int> stack = [0];

    visited[0] = true;

    while (stack.isNotEmpty) {
      int node = stack.removeLast();

      for (var next in graph[node]) {
        int neighbor = next[0];
        int needsReversal = next[1];

        if (!visited[neighbor]) {
          visited[neighbor] = true;

          changes += needsReversal;

          stack.add(neighbor);
        }
      }
    }

    return changes;
  }
}