import 'dart:math';

class Solution {
  List<int> bestCoordinate(List<List<int>> towers, int radius) {
    int bestX = 0;
    int bestY = 0;
    int bestQuality = -1;

    int maxX = 0;
    int maxY = 0;

    for (var t in towers) {
      maxX = max(maxX, t[0]);
      maxY = max(maxY, t[1]);
    }

    for (int x = 0; x <= maxX + radius; x++) {
      for (int y = 0; y <= maxY + radius; y++) {
        int quality = 0;

        for (var t in towers) {
          int dx = x - t[0];
          int dy = y - t[1];
          double dist = sqrt(dx * dx + dy * dy);

          if (dist <= radius) {
            quality += (t[2] / (1 + dist)).floor();
          }
        }

        if (quality > bestQuality ||
            (quality == bestQuality &&
                (x < bestX || (x == bestX && y < bestY)))) {
          bestQuality = quality;
          bestX = x;
          bestY = y;
        }
      }
    }

    return [bestX, bestY];
  }
}