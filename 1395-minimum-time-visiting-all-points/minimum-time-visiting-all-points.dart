class Solution {
  int minTimeToVisitAllPoints(List<List<int>> points) {
    int time = 0;

    for (int i = 1; i < points.length; i++) {
      int x1 = points[i - 1][0];
      int y1 = points[i - 1][1];
      int x2 = points[i][0];
      int y2 = points[i][1];

      time += (x2 - x1).abs().compareTo((y2 - y1).abs()) > 0
          ? (x2 - x1).abs()
          : (y2 - y1).abs();
    }

    return time;
  }
}