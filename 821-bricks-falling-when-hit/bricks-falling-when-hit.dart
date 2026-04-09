class Solution {
  List<int> hitBricks(List<List<int>> grid, List<List<int>> hits) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> parent = List.generate(m * n + 1, (i) => i);
    List<int> size = List.filled(m * n + 1, 1);

    int roof = m * n;

    int index(int r, int c) => r * n + c;

    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }

    void union(int a, int b) {
      a = find(a);
      b = find(b);
      if (a == b) return;

      if (size[a] < size[b]) {
        int temp = a;
        a = b;
        b = temp;
      }

      parent[b] = a;
      size[a] += size[b];
    }

    // copy grid
    List<List<int>> g = List.generate(
      m,
      (i) => List.from(grid[i]),
    );

    // apply hits
    for (var h in hits) {
      if (g[h[0]][h[1]] == 1) {
        g[h[0]][h[1]] = 0;
      }
    }

    // initial union after all hits
    for (int r = 0; r < m; r++) {
      for (int c = 0; c < n; c++) {
        if (g[r][c] == 1) {
          if (r == 0) union(index(r, c), roof);

          if (r > 0 && g[r - 1][c] == 1) {
            union(index(r, c), index(r - 1, c));
          }
          if (c > 0 && g[r][c - 1] == 1) {
            union(index(r, c), index(r, c - 1));
          }
        }
      }
    }

    List<int> res = List.filled(hits.length, 0);

    // reverse processing
    for (int i = hits.length - 1; i >= 0; i--) {
      int r = hits[i][0];
      int c = hits[i][1];

      if (grid[r][c] == 0) {
        continue;
      }

      int prevRoofSize = size[find(roof)];

      g[r][c] = 1;
      int curr = index(r, c);

      if (r == 0) union(curr, roof);

      if (r > 0 && g[r - 1][c] == 1) {
        union(curr, index(r - 1, c));
      }
      if (r + 1 < m && g[r + 1][c] == 1) {
        union(curr, index(r + 1, c));
      }
      if (c > 0 && g[r][c - 1] == 1) {
        union(curr, index(r, c - 1));
      }
      if (c + 1 < n && g[r][c + 1] == 1) {
        union(curr, index(r, c + 1));
      }

      int newRoofSize = size[find(roof)];

      res[i] = (newRoofSize - prevRoofSize - 1).clamp(0, 1000000);
    }

    return res;
  }
}