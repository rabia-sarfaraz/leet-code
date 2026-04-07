import 'dart:math';

class Solution {
  int findRadius(List<int> houses, List<int> heaters) {
    houses.sort();
    heaters.sort();

    int radius = 0;

    for (int house in houses) {
      int idx = lowerBound(heaters, house);

      int dist1 = (idx < heaters.length)
          ? (heaters[idx] - house).abs()
          : 1 << 30;

      int dist2 = (idx > 0)
          ? (house - heaters[idx - 1]).abs()
          : 1 << 30;

      radius = max(radius, min(dist1, dist2));
    }

    return radius;
  }

  int lowerBound(List<int> arr, int target) {
    int l = 0, r = arr.length;

    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (arr[mid] < target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }

    return l;
  }
}