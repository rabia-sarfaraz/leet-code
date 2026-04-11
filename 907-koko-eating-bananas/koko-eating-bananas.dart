class Solution {
  int minEatingSpeed(List<int> piles, int h) {
    int low = 1;
    int high = piles.reduce((a, b) => a > b ? a : b);
    int ans = high;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (canEatAll(piles, h, mid)) {
        ans = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return ans;
  }

  bool canEatAll(List<int> piles, int h, int k) {
    int hours = 0;

    for (int p in piles) {
      hours += (p + k - 1) ~/ k; // ceil(p / k)
    }

    return hours <= h;
  }
}