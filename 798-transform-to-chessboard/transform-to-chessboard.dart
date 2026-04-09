class Solution {
  int movesToChessboard(List<List<int>> board) {
    int n = board.length;

    int rowMask = 0;
    int colMask = 0;

    for (int i = 0; i < n; i++) {
      rowMask = (rowMask << 1) | board[0][i];
      colMask = (colMask << 1) | board[i][0];
    }

    int reverse(int x, int bits) {
      int mask = (1 << bits) - 1;
      return (~x) & mask;
    }

    // check rows validity
    int rowCount = 0, colCount = 0;

    for (int i = 0; i < n; i++) {
      int r = 0, c = 0;
      for (int j = 0; j < n; j++) {
        r = (r << 1) | board[i][j];
        c = (c << 1) | board[j][i];
      }
      if (r != rowMask && r != reverse(rowMask, n)) return -1;
      if (c != colMask && c != reverse(colMask, n)) return -1;

      if (r == rowMask) rowCount++;
      if (c == colMask) colCount++;
    }

    bool validCount(int cnt) {
      if (n % 2 == 0) return cnt == n ~/ 2;
      return cnt == n ~/ 2 || cnt == n ~/ 2 + 1;
    }

    if (!validCount(rowCount) || !validCount(colCount)) return -1;

    int calcSwaps(int mask) {
      int ones = 0;
      for (int i = 0; i < n; i++) {
        if (((mask >> i) & 1) == (i % 2)) ones++;
      }

      if (n % 2 == 0) {
        return (ones < n - ones ? ones : n - ones) ~/ 2;
      } else {
        if (ones % 2 == 1) ones = n - ones;
        return (ones ~/ 2);
      }
    }

    return calcSwaps(rowMask) + calcSwaps(colMask);
  }
}