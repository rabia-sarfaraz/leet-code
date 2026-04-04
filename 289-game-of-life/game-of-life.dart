class Solution {
  void gameOfLife(List<List<int>> board) {
    int m = board.length;
    int n = board[0].length;

    List<List<int>> dirs = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1],          [0, 1],
      [1, -1], [1, 0], [1, 1]
    ];

    // Step 1: mark transitions
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {

        int liveNeighbors = 0;

        for (var d in dirs) {
          int ni = i + d[0];
          int nj = j + d[1];

          if (ni >= 0 && ni < m && nj >= 0 && nj < n) {
            if (board[ni][nj] == 1 || board[ni][nj] == 2) {
              liveNeighbors++;
            }
          }
        }

        if (board[i][j] == 1) {
          if (liveNeighbors < 2 || liveNeighbors > 3) {
            board[i][j] = 2; // live -> dead
          }
        } else {
          if (liveNeighbors == 3) {
            board[i][j] = 3; // dead -> live
          }
        }
      }
    }

    // Step 2: finalize board
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        board[i][j] %= 2;
      }
    }
  }
}