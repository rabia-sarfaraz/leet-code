class Solution {
  int countServers(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> rowCount = List.filled(m, 0);
    List<int> colCount = List.filled(n, 0);

    // Count servers in each row and column
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          rowCount[i]++;
          colCount[j]++;
        }
      }
    }

    int ans = 0;

    // Count servers that share a row or column
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1 &&
            (rowCount[i] > 1 || colCount[j] > 1)) {
          ans++;
        }
      }
    }

    return ans;
  }
}