import 'dart:math';

class Solution {
  int visiblePoints(List<List<int>> points, int angle, List<int> location) {
    List<double> angles = [];
    int same = 0;

    int x0 = location[0];
    int y0 = location[1];

    for (var p in points) {
      int x = p[0];
      int y = p[1];

      if (x == x0 && y == y0) {
        same++;
      } else {
        angles.add(atan2(y - y0, x - x0));
      }
    }

    angles.sort();

    int m = angles.length;
    const double pi2 = 2 * pi;

    List<double> all = List.from(angles);
    for (double a in angles) {
      all.add(a + pi2);
    }

    double limit = angle * pi / 180.0;

    int ans = 0;
    int left = 0;

    for (int right = 0; right < all.length; right++) {
      while (all[right] - all[left] > limit) {
        left++;
      }
      ans = max(ans, right - left + 1);
    }

    return ans + same;
  }
}