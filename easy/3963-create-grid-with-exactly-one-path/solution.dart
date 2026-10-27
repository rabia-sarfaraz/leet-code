
class Solution {
  List<String> createGrid(int m, int n) {
    List<String> grid = [];

    for (int i = 0; i < m; i++) {
      String row = '';

      for (int j = 0; j < n; j++) {
        if (i == 0 || j == n - 1) {
          row += '.';
        } else {
          row += '#';
        }
      }

      grid.add(row);
    }

    return grid;
  }
}
