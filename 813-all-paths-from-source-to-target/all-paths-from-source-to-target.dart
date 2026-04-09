class Solution {
  List<List<int>> allPathsSourceTarget(List<List<int>> graph) {
    int target = graph.length - 1;
    List<List<int>> result = [];

    void dfs(int node, List<int> path) {
      if (node == target) {
        result.add(List.from(path));
        return;
      }

      for (int nei in graph[node]) {
        path.add(nei);
        dfs(nei, path);
        path.removeLast(); // backtrack
      }
    }

    dfs(0, [0]);
    return result;
  }
}