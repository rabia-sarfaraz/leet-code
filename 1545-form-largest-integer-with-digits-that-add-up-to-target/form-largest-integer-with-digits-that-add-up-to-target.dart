class Solution {
  String largestNumber(List<int> cost, int target) {
    List<String?> dp = List.filled(target + 1, null);
    dp[0] = "";

    for (int t = 1; t <= target; t++) {
      for (int d = 9; d >= 1; d--) {
        int c = cost[d - 1];

        if (t >= c && dp[t - c] != null) {
          String candidate = dp[t - c]! + d.toString();

          if (dp[t] == null ||
              candidate.length > dp[t]!.length ||
              (candidate.length == dp[t]!.length &&
                  candidate.compareTo(dp[t]!) > 0)) {
            dp[t] = candidate;
          }
        }
      }
    }

    return dp[target] ?? "0";
  }
}