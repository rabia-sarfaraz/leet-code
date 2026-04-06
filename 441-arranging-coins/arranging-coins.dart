class Solution {
  int arrangeCoins(int n) {
    int left = 1, right = n;
    int ans = 0;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      longSum(int x) => x * (x + 1) ~/ 2;

      if (longSum(mid) <= n) {
        ans = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return ans;
  }
}