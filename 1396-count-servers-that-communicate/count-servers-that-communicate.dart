class Solution {
  int countServers(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> row = List.filled(m, 0);
    List<int> col = List.filled(n, 0);

    // count servers in rows and cols
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          row[i]++;
          col[j]++;
        }
      }
    }

    int count = 0;

    // check communication
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          if (row[i] > 1 || col[j] > 1) {
            count++;
          }
        }
      }
    }

    return count;
  }
}