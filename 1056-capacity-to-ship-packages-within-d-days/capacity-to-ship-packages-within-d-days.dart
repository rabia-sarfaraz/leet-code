class Solution {
  int shipWithinDays(List<int> weights, int days) {
    int low = 0;
    int high = 0;

    for (int w in weights) {
      if (w > low) low = w;
      high += w;
    }

    bool canShip(int cap) {
      int dayCount = 1;
      int current = 0;

      for (int w in weights) {
        if (current + w > cap) {
          dayCount++;
          current = 0;
        }
        current += w;
      }

      return dayCount <= days;
    }

    int ans = high;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (canShip(mid)) {
        ans = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return ans;
  }
}