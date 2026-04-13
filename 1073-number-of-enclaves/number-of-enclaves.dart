class Solution {
  int numEnclaves(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<List<int>> dirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    void bfs(int r, int c) {
      List<List<int>> q = [];
      q.add([r, c]);
      grid[r][c] = 0;

      int i = 0;
      while (i < q.length) {
        var cur = q[i++];
        int x = cur[0], y = cur[1];

        for (var d in dirs) {
          int nx = x + d[0];
          int ny = y + d[1];

          if (nx >= 0 &&
              ny >= 0 &&
              nx < m &&
              ny < n &&
              grid[nx][ny] == 1) {
            grid[nx][ny] = 0;
            q.add([nx, ny]);
          }
        }
      }
    }

    // Step 1: boundary se BFS
    for (int i = 0; i < m; i++) {
      if (grid[i][0] == 1) bfs(i, 0);
      if (grid[i][n - 1] == 1) bfs(i, n - 1);
    }

    for (int j = 0; j < n; j++) {
      if (grid[0][j] == 1) bfs(0, j);
      if (grid[m - 1][j] == 1) bfs(m - 1, j);
    }

    // Step 2: count remaining land
    int count = 0;
    for (var row in grid) {
      for (var cell in row) {
        if (cell == 1) count++;
      }
    }

    return count;
  }
}