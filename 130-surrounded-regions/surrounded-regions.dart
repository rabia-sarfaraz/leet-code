class Solution {
  void solve(List<List<String>> board) {
    if (board.isEmpty) return;

    int rows = board.length;
    int cols = board[0].length;

    // 🔥 Step 1: mark boundary connected O as safe
    for (int i = 0; i < rows; i++) {
      if (board[i][0] == 'O') _dfs(board, i, 0);
      if (board[i][cols - 1] == 'O') _dfs(board, i, cols - 1);
    }

    for (int j = 0; j < cols; j++) {
      if (board[0][j] == 'O') _dfs(board, 0, j);
      if (board[rows - 1][j] == 'O') _dfs(board, rows - 1, j);
    }

    // 🔥 Step 2: flip & restore
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (board[i][j] == 'O') {
          board[i][j] = 'X';
        } else if (board[i][j] == '#') {
          board[i][j] = 'O';
        }
      }
    }
  }

  void _dfs(List<List<String>> board, int i, int j) {
    int rows = board.length;
    int cols = board[0].length;

    if (i < 0 || j < 0 || i >= rows || j >= cols) return;
    if (board[i][j] != 'O') return;

    board[i][j] = '#'; // safe mark

    _dfs(board, i + 1, j);
    _dfs(board, i - 1, j);
    _dfs(board, i, j + 1);
    _dfs(board, i, j - 1);
  }
}