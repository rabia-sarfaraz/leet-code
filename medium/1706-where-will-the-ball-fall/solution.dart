class Solution {
  List<int> findBall(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> ans = [];

    for (int start = 0; start < n; start++) {
      int col = start;

      for (int row = 0; row < m; row++) {
        int dir = grid[row][col];

        // Ball right ja rahi hai
        if (dir == 1) {
          // Right boundary ya V-shape trap
          if (col == n - 1 || grid[row][col + 1] == -1) {
            col = -1;
            break;
          }

          col++;
        }

        // Ball left ja rahi hai
        else {
          // Left boundary ya V-shape trap
          if (col == 0 || grid[row][col - 1] == 1) {
            col = -1;
            break;
          }

          col--;
        }
      }

      ans.add(col);
    }

    return ans;
  }
}