class Solution {
  List<String> findItinerary(List<List<String>> tickets) {
    Map<String, List<String>> graph = {};

    // build graph
    for (var t in tickets) {
      graph.putIfAbsent(t[0], () => []);
      graph[t[0]]!.add(t[1]);
    }

    // sort destinations in reverse (so we can pop from end)
    for (var key in graph.keys) {
      graph[key]!.sort((a, b) => b.compareTo(a));
    }

    List<String> result = [];

    void dfs(String airport) {
      while (graph.containsKey(airport) &&
          graph[airport]!.isNotEmpty) {
        String next = graph[airport]!.removeLast();
        dfs(next);
      }
      result.add(airport);
    }

    dfs("JFK");

    return result.reversed.toList();
  }
}