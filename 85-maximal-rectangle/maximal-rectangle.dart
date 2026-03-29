import 'dart:math';

class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    if (matrix.isEmpty) return 0;

    int rows = matrix.length;
    int cols = matrix[0].length;

    List<int> heights = List.filled(cols, 0);
    int maxArea = 0;

    for (int i = 0; i < rows; i++) {
      // build histogram for current row
      for (int j = 0; j < cols; j++) {
        if (matrix[i][j] == '1') {
          heights[j] += 1;
        } else {
          heights[j] = 0;
        }
      }

      // calculate largest rectangle in histogram
      maxArea = max(maxArea, _largestRectangleArea(heights));
    }

    return maxArea;
  }

  int _largestRectangleArea(List<int> heights) {
    List<int> stack = [];
    int maxArea = 0;
    int n = heights.length;

    for (int i = 0; i <= n; i++) {
      int h = (i == n) ? 0 : heights[i];

      while (stack.isNotEmpty && h < heights[stack.last]) {
        int height = heights[stack.removeLast()];
        int width;

        if (stack.isEmpty) {
          width = i;
        } else {
          width = i - stack.last - 1;
        }

        maxArea = max(maxArea, height * width);
      }

      stack.add(i);
    }

    return maxArea;
  }
}