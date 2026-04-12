class Solution {
  int shortestBridge(List<List<int>> grid) {
    int n = grid.length;

    List<List<int>> dirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    List<List<int>> queue = [];

    bool dfs(int i, int j) {
      if (i < 0 || j < 0 || i >= n || j >= n || grid[i][j] != 1) {
        return false;
      }

      grid[i][j] = 2;
      queue.add([i, j]);

      for (var d in dirs) {
        dfs(i + d[0], j + d[1]);
      }
      return true;
    }

    // Step 1: find and mark first island
    bool found = false;
    for (int i = 0; i < n && !found; i++) {
      for (int j = 0; j < n && !found; j++) {
        if (grid[i][j] == 1) {
          dfs(i, j);
          found = true;
        }
      }
    }

    // Step 2: BFS to reach second island
    int steps = 0;

    while (queue.isNotEmpty) {
      int size = queue.length;

      for (int i = 0; i < size; i++) {
        var cell = queue.removeAt(0);
        int x = cell[0], y = cell[1];

        for (var d in dirs) {
          int nx = x + d[0];
          int ny = y + d[1];

          if (nx < 0 || ny < 0 || nx >= n || ny >= n) continue;

          if (grid[nx][ny] == 1) {
            return steps;
          }

          if (grid[nx][ny] == 0) {
            grid[nx][ny] = 2;
            queue.add([nx, ny]);
          }
        }
      }

      steps++;
    }

    return -1;
  }
}