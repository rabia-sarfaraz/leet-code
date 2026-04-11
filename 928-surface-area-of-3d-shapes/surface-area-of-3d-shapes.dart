class Solution {
  int surfaceArea(List<List<int>> grid) {
    int n = grid.length;
    int res = 0;

    List<List<int>> dir = [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] > 0) {
          res += 2; // top + bottom
        }

        for (var d in dir) {
          int ni = i + d[0];
          int nj = j + d[1];

          int neighbor = 0;
          if (ni >= 0 && ni < n && nj >= 0 && nj < n) {
            neighbor = grid[ni][nj];
          }

          if (grid[i][j] > neighbor) {
            res += grid[i][j] - neighbor;
          }
        }
      }
    }

    return res;
  }
}