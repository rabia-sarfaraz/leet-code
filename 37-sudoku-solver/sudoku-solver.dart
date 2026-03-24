class Solution {
  void solveSudoku(List<List<String>> board) {
    solve(board);
  }

  bool solve(List<List<String>> board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == '.') {
          for (String num in '123456789'.split('')) {
            if (isValid(board, i, j, num)) {
              board[i][j] = num;

              if (solve(board)) {
                return true;
              }

              // backtrack
              board[i][j] = '.';
            }
          }
          return false; // no valid number found
        }
      }
    }
    return true; // solved
  }

  bool isValid(List<List<String>> board, int row, int col, String num) {
    for (int i = 0; i < 9; i++) {
      // row check
      if (board[row][i] == num) return false;

      // column check
      if (board[i][col] == num) return false;

      // 3x3 box check
      int boxRow = 3 * (row ~/ 3) + i ~/ 3;
      int boxCol = 3 * (col ~/ 3) + i % 3;
      if (board[boxRow][boxCol] == num) return false;
    }
    return true;
  }
}