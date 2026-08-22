class Solution {
  List<int> restoreArray(List<List<int>> adjacentPairs) {
    Map<int, List<int>> graph = {};

    // Graph banao
    for (var pair in adjacentPairs) {
      int a = pair[0];
      int b = pair[1];

      graph.putIfAbsent(a, () => []);
      graph.putIfAbsent(b, () => []);

      graph[a]!.add(b);
      graph[b]!.add(a);
    }

    // Endpoint find karo
    // Endpoint ki degree 1 hoti hai
    int start = 0;

    for (var entry in graph.entries) {
      if (entry.value.length == 1) {
        start = entry.key;
        break;
      }
    }

    List<int> result = [];
    int prev = -1;
    int current = start;

    while (result.length < adjacentPairs.length + 1) {
      result.add(current);

      for (int next in graph[current]!) {
        if (next != prev) {
          prev = current;
          current = next;
          break;
        }
      }
    }

    return result;
  }
}