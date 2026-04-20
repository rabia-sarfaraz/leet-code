class Solution {
  int findTheCity(int n, List<List<int>> edges, int distanceThreshold) {
    const int INF = 1 << 30;

    // Step 1: initialize distance matrix
    List<List<int>> dist =
        List.generate(n, (_) => List.filled(n, INF));

    for (int i = 0; i < n; i++) {
      dist[i][i] = 0;
    }

    // Step 2: fill edges
    for (var e in edges) {
      int u = e[0], v = e[1], w = e[2];
      dist[u][v] = w;
      dist[v][u] = w;
    }

    // Step 3: Floyd–Warshall
    for (int k = 0; k < n; k++) {
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          if (dist[i][k] + dist[k][j] < dist[i][j]) {
            dist[i][j] = dist[i][k] + dist[k][j];
          }
        }
      }
    }

    // Step 4: find best city
    int resultCity = -1;
    int minCount = 1 << 30;

    for (int i = 0; i < n; i++) {
      int count = 0;

      for (int j = 0; j < n; j++) {
        if (i != j && dist[i][j] <= distanceThreshold) {
          count++;
        }
      }

      // pick smaller count OR larger index if tie
      if (count < minCount || (count == minCount && i > resultCity)) {
        minCount = count;
        resultCity = i;
      }
    }

    return resultCity;
  }
}