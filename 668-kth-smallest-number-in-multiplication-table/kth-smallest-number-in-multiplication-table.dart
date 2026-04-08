class Solution {
  int findKthNumber(int m, int n, int k) {
    int low = 1;
    int high = m * n;

    while (low < high) {
      int mid = (low + high) ~/ 2;

      if (_count(mid, m, n) >= k) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }

  int _count(int mid, int m, int n) {
    int count = 0;

    for (int i = 1; i <= m; i++) {
      count += (mid ~/ i).clamp(0, n);
    }

    return count;
  }
}