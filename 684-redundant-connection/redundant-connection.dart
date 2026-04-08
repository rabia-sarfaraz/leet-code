class Solution {
  List<int> findRedundantConnection(List<List<int>> edges) {
    int n = edges.length;
    List<int> parent = List.generate(n + 1, (i) => i);
    List<int> rank = List.filled(n + 1, 0);

    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }

    bool union(int x, int y) {
      int px = find(x);
      int py = find(y);

      if (px == py) return false; // cycle found

      if (rank[px] < rank[py]) {
        parent[px] = py;
      } else if (rank[px] > rank[py]) {
        parent[py] = px;
      } else {
        parent[py] = px;
        rank[px]++;
      }

      return true;
    }

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      if (!union(u, v)) {
        return edge;
      }
    }

    return [];
  }
}