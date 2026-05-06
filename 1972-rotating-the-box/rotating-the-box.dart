class Solution {
  List<List<String>> rotateTheBox(List<List<String>> boxGrid) {
    int m = boxGrid.length;
    int n = boxGrid[0].length;

    // Step 1: Apply gravity (right side ki taraf stones girenge)
    for (int i = 0; i < m; i++) {
      int empty = n - 1; // rightmost position

      for (int j = n - 1; j >= 0; j--) {
        if (boxGrid[i][j] == '*') {
          empty = j - 1; // obstacle ke baad reset
        } else if (boxGrid[i][j] == '#') {
          // swap stone to empty position
          boxGrid[i][j] = '.';
          boxGrid[i][empty] = '#';
          empty--;
        }
      }
    }

    // Step 2: Rotate 90 degree clockwise
    List<List<String>> res =
        List.generate(n, (_) => List.filled(m, '.'));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        res[j][m - 1 - i] = boxGrid[i][j];
      }
    }

    return res;
  }
}