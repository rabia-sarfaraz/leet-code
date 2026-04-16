class Solution {
  List<int> shortestAlternatingPaths(int n, List<List<int>> redEdges, List<List<int>> blueEdges) {
    
    Map<int, List<List<int>>> graph = {};
    
    for (int i = 0; i < n; i++) {
      graph[i] = [];
    }
    
    // red = 0, blue = 1
    for (var e in redEdges) {
      graph[e[0]]!.add([e[1], 0]);
    }
    
    for (var e in blueEdges) {
      graph[e[0]]!.add([e[1], 1]);
    }
    
    List<List<bool>> visited = List.generate(n, (_) => [false, false]);
    
    List<int> result = List.filled(n, -1);
    
    List<List<int>> queue = [];
    
    // start node with both possibilities
    queue.add([0, -1, 0]); // node, color, dist
    visited[0][0] = visited[0][1] = true;
    
    while (queue.isNotEmpty) {
      var cur = queue.removeAt(0);
      int node = cur[0];
      int prevColor = cur[1];
      int dist = cur[2];
      
      if (result[node] == -1) {
        result[node] = dist;
      }
      
      for (var edge in graph[node]!) {
        int next = edge[0];
        int color = edge[1];
        
        if (color != prevColor && !visited[next][color]) {
          visited[next][color] = true;
          queue.add([next, color, dist + 1]);
        }
      }
    }
    
    return result;
  }
}