class Solution {
  late List<List<int>> grid;
  late int rows;
  late int cols;
  late List<List<List<int>>> memo;

  int cherryPickup(List<List<int>> grid) {
    this.grid = grid;
    rows = grid.length;
    cols = grid[0].length;

    memo = List.generate(
      rows,
      (_) => List.generate(
        cols,
        (_) => List.filled(cols, -1),
      ),
    );

    return dfs(0, 0, cols - 1);
  }

  int dfs(int row, int col1, int col2) {
    // Out of bounds
    if (col1 < 0 || col1 >= cols || col2 < 0 || col2 >= cols) {
      return 0;
    }

    // Already computed
    if (memo[row][col1][col2] != -1) {
      return memo[row][col1][col2];
    }

    int cherries = 0;

    // Same cell
    if (col1 == col2) {
      cherries = grid[row][col1];
    } else {
      cherries = grid[row][col1] + grid[row][col2];
    }

    // Last row
    if (row == rows - 1) {
      return cherries;
    }

    int maxCherries = 0;

    // Explore all 9 moves
    for (int d1 = -1; d1 <= 1; d1++) {
      for (int d2 = -1; d2 <= 1; d2++) {
        maxCherries = max(
          maxCherries,
          dfs(row + 1, col1 + d1, col2 + d2),
        );
      }
    }

    memo[row][col1][col2] = cherries + maxCherries;

    return memo[row][col1][col2];
  }

  int max(int a, int b) {
    return a > b ? a : b;
  }
}