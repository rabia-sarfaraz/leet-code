class Solution {
  int mincostTickets(List<int> days, List<int> costs) {
    int n = days.length;
    List<int> dp = List.filled(n + 1, 0);

    for (int i = n - 1; i >= 0; i--) {
      // 1-day pass
      int j = i;
      while (j < n && days[j] < days[i] + 1) j++;
      int cost1 = costs[0] + dp[j];

      // 7-day pass
      j = i;
      while (j < n && days[j] < days[i] + 7) j++;
      int cost7 = costs[1] + dp[j];

      // 30-day pass
      j = i;
      while (j < n && days[j] < days[i] + 30) j++;
      int cost30 = costs[2] + dp[j];

      dp[i] = cost1 < cost7
          ? (cost1 < cost30 ? cost1 : cost30)
          : (cost7 < cost30 ? cost7 : cost30);
    }

    return dp[0];
  }
}