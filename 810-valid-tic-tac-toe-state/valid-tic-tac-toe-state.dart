class Solution {
  bool validTicTacToe(List<String> board) {
    int xCount = 0;
    int oCount = 0;

    // count X and O
    for (var row in board) {
      for (var ch in row.split('')) {
        if (ch == 'X') xCount++;
        if (ch == 'O') oCount++;
      }
    }

    bool win(String p) {
      // rows
      for (int i = 0; i < 3; i++) {
        if (board[i][0] == p && board[i][1] == p && board[i][2] == p)
          return true;
      }

      // cols
      for (int j = 0; j < 3; j++) {
        if (board[0][j] == p && board[1][j] == p && board[2][j] == p)
          return true;
      }

      // diagonals
      if (board[0][0] == p && board[1][1] == p && board[2][2] == p)
        return true;

      if (board[0][2] == p && board[1][1] == p && board[2][0] == p)
        return true;

      return false;
    }

    // rule 1: count validity
    if (!(xCount == oCount || xCount == oCount + 1)) {
      return false;
    }

    bool xWin = win('X');
    bool oWin = win('O');

    // rule 2: both cannot win
    if (xWin && oWin) return false;

    // rule 3: X win condition
    if (xWin && xCount != oCount + 1) return false;

    // rule 4: O win condition
    if (oWin && xCount != oCount) return false;

    return true;
  }
}