class Solution {
  int minFallingPathSum(List<List<int>> grid) {
    int n = grid.length;

    List<int> prev = List.from(grid[0]);

    for (int i = 1; i < n; i++) {
      int min1 = 1000000000, min2 = 1000000000;
      int idx1 = -1;

      // find smallest & second smallest in prev row
      for (int j = 0; j < n; j++) {
        if (prev[j] < min1) {
          min2 = min1;
          min1 = prev[j];
          idx1 = j;
        } else if (prev[j] < min2) {
          min2 = prev[j];
        }
      }

      List<int> curr = List.filled(n, 0);

      for (int j = 0; j < n; j++) {
        if (j == idx1) {
          curr[j] = grid[i][j] + min2;
        } else {
          curr[j] = grid[i][j] + min1;
        }
      }

      prev = curr;
    }

    return prev.reduce((a, b) => a < b ? a : b);
  }
}