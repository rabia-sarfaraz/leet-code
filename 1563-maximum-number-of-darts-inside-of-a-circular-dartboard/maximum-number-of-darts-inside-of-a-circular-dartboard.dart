import 'dart:math';

class Solution {
  int numPoints(List<List<int>> darts, int r) {
    int n = darts.length;
    int ans = 1;

    double radius = r.toDouble();

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        double x1 = darts[i][0].toDouble();
        double y1 = darts[i][1].toDouble();
        double x2 = darts[j][0].toDouble();
        double y2 = darts[j][1].toDouble();

        double dx = x2 - x1;
        double dy = y2 - y1;

        double d = sqrt(dx * dx + dy * dy);

        if (d > 2 * radius) continue;

        double midX = (x1 + x2) / 2.0;
        double midY = (y1 + y2) / 2.0;

        double h = sqrt(radius * radius - (d / 2) * (d / 2));

        double ux = -dy / d;
        double uy = dx / d;

        List<List<double>> centers = [
          [midX + ux * h, midY + uy * h],
          [midX - ux * h, midY - uy * h]
        ];

        for (var center in centers) {
          double cx = center[0];
          double cy = center[1];

          int count = 0;

          for (var p in darts) {
            double px = p[0].toDouble();
            double py = p[1].toDouble();

            double dist = sqrt((px - cx) * (px - cx) +
                (py - cy) * (py - cy));

            if (dist <= radius + 1e-7) {
              count++;
            }
          }

          ans = max(ans, count);
        }
      }
    }

    return ans;
  }
}