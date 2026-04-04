class Solution {
  int maxPoints(List<List<int>> points) {
    int n = points.length;
    if (n <= 2) return n;

    int res = 0;

    for (int i = 0; i < n; i++) {
      Map<String, int> map = {};
      int same = 1;
      int maxCount = 0;

      for (int j = i + 1; j < n; j++) {
        int dx = points[j][0] - points[i][0];
        int dy = points[j][1] - points[i][1];

        // duplicate point
        if (dx == 0 && dy == 0) {
          same++;
          continue;
        }

        int g = _gcd(dx, dy);
        dx ~/= g;
        dy ~/= g;

        // FIXED normalization
        if (dx == 0) {
          dy = 1;
        } else if (dy == 0) {
          dx = 1;
        } else {
          if (dx < 0) {
            dx = -dx;
            dy = -dy;
          }
        }

        String key = "$dx/$dy";
        map[key] = (map[key] ?? 0) + 1;

        if (map[key]! > maxCount) {
          maxCount = map[key]!;
        }
      }

      if (maxCount + same > res) {
        res = maxCount + same;
      }
    }

    return res;
  }

  int _gcd(int a, int b) {
    a = a.abs();
    b = b.abs();
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}