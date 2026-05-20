class Solution {
  int minDays(List<int> bloomDay, int m, int k) {
    int n = bloomDay.length;

    // Not enough flowers
    if (m * k > n) return -1;

    int left = bloomDay.reduce((a, b) => a < b ? a : b);
    int right = bloomDay.reduce((a, b) => a > b ? a : b);

    bool canMake(int day) {
      int bouquets = 0;
      int flowers = 0;

      for (int bloom in bloomDay) {
        if (bloom <= day) {
          flowers++;

          if (flowers == k) {
            bouquets++;
            flowers = 0;
          }
        } else {
          flowers = 0;
        }
      }

      return bouquets >= m;
    }

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (canMake(mid)) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }
}