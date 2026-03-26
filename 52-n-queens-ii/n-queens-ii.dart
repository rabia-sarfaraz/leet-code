class Solution {
  int totalNQueens(int n) {
    int count = 0;

    List<bool> cols = List.filled(n, false);
    List<bool> diag1 = List.filled(2 * n, false); // row - col + n
    List<bool> diag2 = List.filled(2 * n, false); // row + col

    void backtrack(int row) {
      if (row == n) {
        count++;
        return;
      }

      for (int col = 0; col < n; col++) {
        int d1 = row - col + n;
        int d2 = row + col;

        if (cols[col] || diag1[d1] || diag2[d2]) continue;

        // place queen
        cols[col] = true;
        diag1[d1] = true;
        diag2[d2] = true;

        backtrack(row + 1);

        // backtrack
        cols[col] = false;
        diag1[d1] = false;
        diag2[d2] = false;
      }
    }

    backtrack(0);
    return count;
  }
}