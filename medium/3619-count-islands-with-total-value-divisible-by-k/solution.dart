
class Solution {
  int countIslands(List<List<int>> grid, int k) {
    int m = grid.length;
    int n = grid[0].length;
    int count = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] <= 0) continue;

        int sum = 0;
        List<int> stack = [i * n + j];

        while (stack.isNotEmpty) {
          int cell = stack.removeLast();
          int r = cell ~/ n;
          int c = cell % n;

          if (grid[r][c] <= 0) continue;

          sum += grid[r][c];
          grid[r][c] = 0;

          if (r > 0 && grid[r - 1][c] > 0) {
            stack.add((r - 1) * n + c);
          }
          if (r + 1 < m && grid[r + 1][c] > 0) {
            stack.add((r + 1) * n + c);
          }
          if (c > 0 && grid[r][c - 1] > 0) {
            stack.add(r * n + c - 1);
          }
          if (c + 1 < n && grid[r][c + 1] > 0) {
            stack.add(r * n + c + 1);
          }
        }

        if (sum % k == 0) count++;
      }
    }

    return count;
  }
}
