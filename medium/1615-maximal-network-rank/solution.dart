class Solution {
  int maximalNetworkRank(int n, List<List<int>> roads) {
    List<int> degree = List.filled(n, 0);
    List<List<bool>> connected =
        List.generate(n, (_) => List.filled(n, false));

    for (var road in roads) {
      int u = road[0];
      int v = road[1];
      degree[u]++;
      degree[v]++;
      connected[u][v] = true;
      connected[v][u] = true;
    }

    int ans = 0;

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        int rank = degree[i] + degree[j];
        if (connected[i][j]) rank--;
        if (rank > ans) ans = rank;
      }
    }

    return ans;
  }
}