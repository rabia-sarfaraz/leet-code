class Solution {
  int maxValue(List<List<int>> events, int k) {
    events.sort((a, b) => a[0].compareTo(b[0]));

    int n = events.length;

    // dp[i][j] = first i events mein se maximum value
    // using at most j events
    List<List<int>> dp =
        List.generate(n + 1, (_) => List.filled(k + 1, 0));

    // Har event ke baad next non-overlapping event find karo
    List<int> next = List.filled(n, n);

    for (int i = 0; i < n; i++) {
      int low = i + 1;
      int high = n;

      while (low < high) {
        int mid = (low + high) ~/ 2;

        if (events[mid][0] > events[i][1]) {
          high = mid;
        } else {
          low = mid + 1;
        }
      }

      next[i] = low;
    }

    for (int i = n - 1; i >= 0; i--) {
      for (int j = 1; j <= k; j++) {
        // Event skip karo
        dp[i][j] = dp[i + 1][j];

        // Event attend karo
        int take =
            events[i][2] + dp[next[i]][j - 1];

        if (take > dp[i][j]) {
          dp[i][j] = take;
        }
      }
    }

    return dp[0][k];
  }
}