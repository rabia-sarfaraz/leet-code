class Solution {
  Map<String, Map<String, double>> graph = {};

  List<double> calcEquation(
      List<List<String>> equations,
      List<double> values,
      List<List<String>> queries) {
    
    // Build graph
    for (int i = 0; i < equations.length; i++) {
      String a = equations[i][0];
      String b = equations[i][1];
      double val = values[i];

      graph.putIfAbsent(a, () => {});
      graph.putIfAbsent(b, () => {});

      graph[a]![b] = val;
      graph[b]![a] = 1 / val;
    }

    List<double> result = [];

    for (var q in queries) {
      String src = q[0];
      String dst = q[1];

      if (!graph.containsKey(src) || !graph.containsKey(dst)) {
        result.add(-1.0);
      } else {
        Set<String> visited = {};
        result.add(_dfs(src, dst, 1.0, visited));
      }
    }

    return result;
  }

  double _dfs(String src, String dst, double product, Set<String> visited) {
    if (src == dst) return product;

    visited.add(src);

    for (var neighbor in graph[src]!.keys) {
      if (!visited.contains(neighbor)) {
        double res = _dfs(neighbor, dst, product * graph[src]![neighbor]!, visited);
        if (res != -1.0) return res;
      }
    }

    return -1.0;
  }
}