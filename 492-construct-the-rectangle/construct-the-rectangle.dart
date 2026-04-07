import 'dart:math';

class Solution {
  List<int> constructRectangle(int area) {
    for (int w = sqrt(area).toInt(); w >= 1; w--) {
      if (area % w == 0) {
        return [area ~/ w, w];
      }
    }
    return [area, 1];
  }
}