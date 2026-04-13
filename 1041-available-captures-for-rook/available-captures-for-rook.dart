class Solution {
  int numRookCaptures(List<List<String>> board) {
    int n = 8;
    int rx = 0, ry = 0;

    // find rook position
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == 'R') {
          rx = i;
          ry = j;
        }
      }
    }

    int count = 0;

    List<List<int>> dirs = [
      [-1, 0], // up
      [1, 0],  // down
      [0, -1], // left
      [0, 1],  // right
    ];

    for (var d in dirs) {
      int x = rx + d[0];
      int y = ry + d[1];

      while (x >= 0 && x < n && y >= 0 && y < n) {
        if (board[x][y] == 'B') break;
        if (board[x][y] == 'p') {
          count++;
          break;
        }
        x += d[0];
        y += d[1];
      }
    }

    return count;
  }
}