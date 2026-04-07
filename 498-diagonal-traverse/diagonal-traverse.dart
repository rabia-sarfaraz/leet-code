class Solution {
  List<int> findDiagonalOrder(List<List<int>> mat) {
    if (mat.isEmpty) return [];

    int m = mat.length;
    int n = mat[0].length;

    List<int> res = [];
    int r = 0, c = 0;
    bool up = true;

    for (int i = 0; i < m * n; i++) {
      res.add(mat[r][c]);

      if (up) {
        if (c == n - 1) {
          r++;
          up = false;
        } else if (r == 0) {
          c++;
          up = false;
        } else {
          r--;
          c++;
        }
      } else {
        if (r == m - 1) {
          c++;
          up = true;
        } else if (c == 0) {
          r++;
          up = true;
        } else {
          r++;
          c--;
        }
      }
    }

    return res;
  }
}