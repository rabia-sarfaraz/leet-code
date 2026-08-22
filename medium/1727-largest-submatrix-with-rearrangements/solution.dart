class Solution {
  int largestSubmatrix(List<List<int>> matrix) {
    int rows = matrix.length;
    int cols = matrix[0].length;
    int ans = 0;

    List<int> height = List.filled(cols, 0);

    for (int i = 0; i < rows; i++) {
      // Har column ki consecutive 1s ki height
      for (int j = 0; j < cols; j++) {
        if (matrix[i][j] == 1) {
          height[j]++;
        } else {
          height[j] = 0;
        }
      }

      // Current row ki heights sort karo
      List<int> sorted = List.from(height);
      sorted.sort((a, b) => b.compareTo(a));

      // Largest possible rectangle
      for (int j = 0; j < cols; j++) {
        int area = sorted[j] * (j + 1);
        ans = ans > area ? ans : area;
      }
    }

    return ans;
  }
}