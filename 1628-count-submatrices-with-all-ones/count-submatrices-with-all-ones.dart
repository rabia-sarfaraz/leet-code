class Solution {
  int numSubmat(List<List<int>> mat) {
    int rows = mat.length;
    int cols = mat[0].length;

    List<int> height = List.filled(cols, 0);

    int ans = 0;

    for (int i = 0; i < rows; i++) {

      // Build heights
      for (int j = 0; j < cols; j++) {
        if (mat[i][j] == 0) {
          height[j] = 0;
        } else {
          height[j] += 1;
        }
      }

      // Count submatrices ending at current row
      for (int j = 0; j < cols; j++) {

        int minHeight = height[j];

        for (int k = j; k >= 0 && minHeight > 0; k--) {

          minHeight = minHeight < height[k]
              ? minHeight
              : height[k];

          ans += minHeight;
        }
      }
    }

    return ans;
  }
}