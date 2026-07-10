class Solution {
  int minDays(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    int countIslands() {
      List<List<bool>> vis =
          List.generate(m, (_) => List.filled(n, false));

      int islands = 0;
      List<int> dx = [1, -1, 0, 0];
      List<int> dy = [0, 0, 1, -1];

      void dfs(int x, int y) {
        vis[x][y] = true;
        for (int k = 0; k < 4; k++) {
          int nx = x + dx[k];
          int ny = y + dy[k];
          if (nx >= 0 &&
              nx < m &&
              ny >= 0 &&
              ny < n &&
              !vis[nx][ny] &&
              grid[nx][ny] == 1) {
            dfs(nx, ny);
          }
        }
      }

      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          if (grid[i][j] == 1 && !vis[i][j]) {
            islands++;
            dfs(i, j);
          }
        }
      }

      return islands;
    }

    if (countIslands() != 1) return 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          grid[i][j] = 0;
          if (countIslands() != 1) {
            return 1;
          }
          grid[i][j] = 1;
        }
      }
    }

    return 2;
  }
}