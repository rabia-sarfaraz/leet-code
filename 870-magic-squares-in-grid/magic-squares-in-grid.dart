class Solution {
  int numMagicSquaresInside(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    bool isMagic(int r, int c) {
      List<int> seen = List.filled(10, 0);

      // check numbers + mark seen
      for (int i = r; i < r + 3; i++) {
        for (int j = c; j < c + 3; j++) {
          int val = grid[i][j];
          if (val < 1 || val > 9) return false;
          seen[val]++;
        }
      }

      for (int i = 1; i <= 9; i++) {
        if (seen[i] != 1) return false;
      }

      // row sums
      for (int i = 0; i < 3; i++) {
        int sum = 0;
        for (int j = 0; j < 3; j++) {
          sum += grid[r + i][c + j];
        }
        if (sum != 15) return false;
      }

      // col sums
      for (int j = 0; j < 3; j++) {
        int sum = 0;
        for (int i = 0; i < 3; i++) {
          sum += grid[r + i][c + j];
        }
        if (sum != 15) return false;
      }

      // diagonals
      int d1 = grid[r][c] + grid[r + 1][c + 1] + grid[r + 2][c + 2];
      int d2 = grid[r][c + 2] + grid[r + 1][c + 1] + grid[r + 2][c];

      return d1 == 15 && d2 == 15;
    }

    int count = 0;

    for (int i = 0; i + 2 < m; i++) {
      for (int j = 0; j + 2 < n; j++) {
        if (isMagic(i, j)) {
          count++;
        }
      }
    }

    return count;
  }
}