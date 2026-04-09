class Solution {
  List<int> eventualSafeNodes(List<List<int>> graph) {
    int n = graph.length;
    List<int> state = List.filled(n, 0);

    bool dfs(int node) {
      if (state[node] == 1) return false; // cycle detected
      if (state[node] == 2) return true;  // already safe

      state[node] = 1; // mark visiting

      for (int nei in graph[node]) {
        if (!dfs(nei)) return false;
      }

      state[node] = 2; // safe
      return true;
    }

    List<int> result = [];

    for (int i = 0; i < n; i++) {
      if (dfs(i)) result.add(i);
    }

    return result;
  }
}