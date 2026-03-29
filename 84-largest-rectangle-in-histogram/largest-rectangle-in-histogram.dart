import 'dart:math';

class Solution {
  int largestRectangleArea(List<int> heights) {
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