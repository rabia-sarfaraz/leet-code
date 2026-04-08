class Solution {
  int maxCount(int m, int n, List<List<int>> ops) {
    if (ops.isEmpty) {
      return m * n;
    }

    int minRow = m;
    int minCol = n;

    for (var op in ops) {
      minRow = minRow < op[0] ? minRow : op[0];
      minCol = minCol < op[1] ? minCol : op[1];
    }

    return minRow * minCol;
  }
}