class Solution {
  late List<int> parent;

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa != pb) {
      parent[pa] = pb;
    }
  }

  int regionsBySlashes(List<String> grid) {
    int n = grid.length;
    int size = n * n * 4;

    parent = List.generate(size, (i) => i);

    for (int r = 0; r < n; r++) {
      for (int c = 0; c < n; c++) {
        int root = (r * n + c) * 4;
        String ch = grid[r][c];

        // connect internal triangles
        if (ch == ' ') {
          union(root + 0, root + 1);
          union(root + 1, root + 2);
          union(root + 2, root + 3);
        } 
        else if (ch == '/') {
          union(root + 0, root + 3);
          union(root + 1, root + 2);
        } 
        else if (ch == '\\') {
          union(root + 0, root + 1);
          union(root + 2, root + 3);
        }

        // connect with bottom cell
        if (r + 1 < n) {
          int bottom = ((r + 1) * n + c) * 4;
          union(root + 2, bottom + 0);
        }

        // connect with right cell
        if (c + 1 < n) {
          int right = (r * n + c + 1) * 4;
          union(root + 1, right + 3);
        }
      }
    }

    // count components
    int count = 0;
    for (int i = 0; i < size; i++) {
      if (find(i) == i) count++;
    }

    return count;
  }
}