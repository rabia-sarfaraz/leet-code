class Solution {
  int minAreaRect(List<List<int>> points) {
    Set<String> pointSet = {};

    for (var p in points) {
      pointSet.add("${p[0]},${p[1]}");
    }

    int ans = double.maxFinite.toInt();
    int n = points.length;

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        int x1 = points[i][0], y1 = points[i][1];
        int x2 = points[j][0], y2 = points[j][1];

        // must be diagonal
        if (x1 == x2 || y1 == y2) continue;

        // check other two corners
        if (pointSet.contains("$x1,$y2") &&
            pointSet.contains("$x2,$y1")) {
          int area = (x1 - x2).abs() * (y1 - y2).abs();
          if (area < ans) {
            ans = area;
          }
        }
      }
    }

    return ans == double.maxFinite.toInt() ? 0 : ans;
  }
}