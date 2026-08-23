class Solution {
  static const int MOD = 1000000007;

  int countRestrictedPaths(int n, List<List<int>> edges) {
    List<List<List<int>>> graph =
        List.generate(n + 1, (_) => []);

    for (var e in edges) {
      int u = e[0];
      int v = e[1];
      int w = e[2];

      graph[u].add([v, w]);
      graph[v].add([u, w]);
    }

    // Dijkstra from node n
    const int INF = 1 << 60;

    List<int> dist = List.filled(n + 1, INF);
    dist[n] = 0;

    // [distance, node]
    List<List<int>> heap = [
      [0, n]
    ];

    void push(int d, int node) {
      heap.add([d, node]);

      int i = heap.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (heap[p][0] <= heap[i][0]) {
          break;
        }

        var temp = heap[p];
        heap[p] = heap[i];
        heap[i] = temp;

        i = p;
      }
    }

    List<int> pop() {
      List<int> result = heap[0];
      List<int> last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;

        int i = 0;

        while (true) {
          int left = i * 2 + 1;
          int right = i * 2 + 2;
          int smallest = i;

          if (left < heap.length &&
              heap[left][0] < heap[smallest][0]) {
            smallest = left;
          }

          if (right < heap.length &&
              heap[right][0] < heap[smallest][0]) {
            smallest = right;
          }

          if (smallest == i) {
            break;
          }

          var temp = heap[i];
          heap[i] = heap[smallest];
          heap[smallest] = temp;

          i = smallest;
        }
      }

      return result;
    }

    while (heap.isNotEmpty) {
      List<int> current = pop();

      int d = current[0];
      int u = current[1];

      if (d != dist[u]) continue;

      for (var edge in graph[u]) {
        int v = edge[0];
        int w = edge[1];

        if (d + w < dist[v]) {
          dist[v] = d + w;
          push(dist[v], v);
        }
      }
    }

    // Sort nodes by shortest distance
    List<int> nodes = List.generate(n, (i) => i + 1);

    nodes.sort((a, b) => dist[a].compareTo(dist[b]));

    // dp[u] = number of restricted paths from u to n
    List<int> dp = List.filled(n + 1, 0);
    dp[n] = 1;

    // Smaller distance nodes are already calculated
    for (int u in nodes) {
      if (u == n) continue;

      int ways = 0;

      for (var edge in graph[u]) {
        int v = edge[0];

        if (dist[v] < dist[u]) {
          ways += dp[v];

          if (ways >= MOD) {
            ways -= MOD;
          }
        }
      }

      dp[u] = ways;
    }

    return dp[1];
  }
}