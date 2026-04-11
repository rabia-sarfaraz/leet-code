class Solution {
  int projectionArea(List<List<int>> grid) {
    int n = grid.length;

    int top = 0;
    int front = 0;
    int side = 0;

    for (int i = 0; i < n; i++) {
      int rowMax = 0;
      int colMax = 0;

      for (int j = 0; j < n; j++) {
        // top view
        if (grid[i][j] > 0) top++;

        // row max (front)
        if (grid[i][j] > rowMax) rowMax = grid[i][j];

        // column max (side)
        if (grid[j][i] > colMax) colMax = grid[j][i];
      }

      front += rowMax;
      side += colMax;
    }

    return top + front + side;
  }
}