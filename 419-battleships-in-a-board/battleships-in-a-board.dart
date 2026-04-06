class Solution {
  int countBattleships(List<List<String>> board) {
    int m = board.length;
    int n = board[0].length;

    int count = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == 'X') {
          // check if it's the start of a new ship
          bool hasUp = i > 0 && board[i - 1][j] == 'X';
          bool hasLeft = j > 0 && board[i][j - 1] == 'X';

          if (!hasUp && !hasLeft) {
            count++;
          }
        }
      }
    }

    return count;
  }
}