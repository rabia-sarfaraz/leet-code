class Solution {
  String tictactoe(List<List<int>> moves) {
    List<int> rows = List.filled(3, 0);
    List<int> cols = List.filled(3, 0);
    int diag = 0, antiDiag = 0;

    for (int i = 0; i < moves.length; i++) {
      int r = moves[i][0];
      int c = moves[i][1];

      int player = (i % 2 == 0) ? 1 : -1;

      rows[r] += player;
      cols[c] += player;

      if (r == c) diag += player;
      if (r + c == 2) antiDiag += player;

      if (rows[r].abs() == 3 ||
          cols[c].abs() == 3 ||
          diag.abs() == 3 ||
          antiDiag.abs() == 3) {
        return player == 1 ? "A" : "B";
      }
    }

    return moves.length == 9 ? "Draw" : "Pending";
  }
}