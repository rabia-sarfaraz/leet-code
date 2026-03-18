class Solution {
  int maxArea(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int maxArea = 0;

    while (left < right) {
      int width = right - left;
      int area = width * (height[left] < height[right] ? height[left] : height[right]);
      if (area > maxArea) {
        maxArea = area;
      }

      // Move the smaller height pointer
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxArea;
  }
}