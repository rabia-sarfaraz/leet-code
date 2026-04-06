class Solution {
  bool isRectangleCover(List<List<int>> rectangles) {
    Set<String> corners = {};
    int area = 0;

    int minX = 1 << 30;
    int minY = 1 << 30;
    int maxX = -1 << 30;
    int maxY = -1 << 30;

    for (var r in rectangles) {
      int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];

      area += (x2 - x1) * (y2 - y1);

      minX = minX < x1 ? minX : x1;
      minY = minY < y1 ? minY : y1;
      maxX = maxX > x2 ? maxX : x2;
      maxY = maxY > y2 ? maxY : y2;

      List<List<int>> pts = [
        [x1, y1],
        [x1, y2],
        [x2, y1],
        [x2, y2]
      ];

      for (var p in pts) {
        String key = "${p[0]}_${p[1]}";
        if (corners.contains(key)) {
          corners.remove(key);
        } else {
          corners.add(key);
        }
      }
    }

    int expectedArea = (maxX - minX) * (maxY - minY);

    if (area != expectedArea) return false;

    if (corners.length != 4) return false;

    Set<String> expected = {
      "${minX}_${minY}",
      "${minX}_${maxY}",
      "${maxX}_${minY}",
      "${maxX}_${maxY}",
    };

    return corners.containsAll(expected);
  }
}