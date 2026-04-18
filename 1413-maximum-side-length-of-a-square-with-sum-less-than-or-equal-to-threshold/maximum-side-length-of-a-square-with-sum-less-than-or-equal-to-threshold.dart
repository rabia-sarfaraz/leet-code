class Solution {
  int maxSideLength(List<List<int>> mat, int threshold) {
    int m = mat.length;
    int n = mat[0].length;

    List<List<int>> prefix =
        List.generate(m + 1, (_) => List.filled(n + 1, 0));

    // build prefix sum
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        prefix[i][j] = mat[i - 1][j - 1] +
            prefix[i - 1][j] +
            prefix[i][j - 1] -
            prefix[i - 1][j - 1];
      }
    }

    bool check(int k) {
      for (int i = k; i <= m; i++) {
        for (int j = k; j <= n; j++) {
          int sum = prefix[i][j] -
              prefix[i - k][j] -
              prefix[i][j - k] +
              prefix[i - k][j - k];

          if (sum <= threshold) return true;
        }
      }
      return false;
    }

    int left = 0, right = m < n ? m : n;
    int ans = 0;

    while (left <= right) {
      int mid = (left + right) ~/ 2;

      if (check(mid)) {
        ans = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return ans;
  }
}