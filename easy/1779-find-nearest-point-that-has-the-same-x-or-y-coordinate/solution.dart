class Solution {
  int nearestValidPoint(int x, int y, List<List<int>> points) {
    int minDistance = 1 << 30;
    int answer = -1;

    for (int i = 0; i < points.length; i++) {
      int px = points[i][0];
      int py = points[i][1];

      // Valid point: same x OR same y
      if (px == x || py == y) {
        int distance = (x - px).abs() + (y - py).abs();

        if (distance < minDistance) {
          minDistance = distance;
          answer = i;
        }
      }
    }

    return answer;
  }
}