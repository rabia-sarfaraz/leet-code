class Solution {
  double minAreaFreeRect(List<List<int>> points) {
    int n = points.length;

    // key: "midX,midY,sqDist" -> list of diagonals
    Map<String, List<List<int>>> map = {};

    String getKey(double mx, double my, double dist) {
      return "$mx,$my,$dist";
    }

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        double mx = (points[i][0] + points[j][0]) / 2.0;
        double my = (points[i][1] + points[j][1]) / 2.0;

        double dx = (points[i][0] - points[j][0]).toDouble();
        double dy = (points[i][1] - points[j][1]).toDouble();
        double dist = dx * dx + dy * dy;

        String key = getKey(mx, my, dist);

        if (!map.containsKey(key)) {
          map[key] = [];
        }
        map[key]!.add([i, j]);
      }
    }

    double ans = double.infinity;

    for (var entry in map.entries) {
      var list = entry.value;

      if (list.length < 2) continue;

      for (int a = 0; a < list.length; a++) {
        for (int b = a + 1; b < list.length; b++) {
          var p1 = points[list[a][0]];
          var p2 = points[list[a][1]];
          var p3 = points[list[b][0]];

          // vector p1->p2 and p1->p3
          double x1 = (p2[0] - p1[0]).toDouble();
          double y1 = (p2[1] - p1[1]).toDouble();

          double x2 = (p3[0] - p1[0]).toDouble();
          double y2 = (p3[1] - p1[1]).toDouble();

          double area = (x1 * y2 - y1 * x2).abs();

          if (area > 0) {
            ans = ans < area ? ans : area;
          }
        }
      }
    }

    return ans == double.infinity ? 0.0 : ans;
  }
}