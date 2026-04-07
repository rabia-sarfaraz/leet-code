import 'dart:math';

class Solution {
  late List<List<int>> rects;
  List<int> prefix = [];
  int total = 0;
  Random rand = Random();

  Solution(List<List<int>> rects) {
    this.rects = rects;

    for (var r in rects) {
      int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];
      int area = (x2 - x1 + 1) * (y2 - y1 + 1);
      total += area;
      prefix.add(total);
    }
  }

  List<int> pick() {
    int target = rand.nextInt(total);

    int l = 0, r = prefix.length - 1;

    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (prefix[mid] > target) {
        r = mid;
      } else {
        l = mid + 1;
      }
    }

    var rect = rects[l];

    int x1 = rect[0], y1 = rect[1], x2 = rect[2], y2 = rect[3];

    int x = x1 + rand.nextInt(x2 - x1 + 1);
    int y = y1 + rand.nextInt(y2 - y1 + 1);

    return [x, y];
  }
}