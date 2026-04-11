class Solution {
  int profitableSchemes(int n, int minProfit, List<int> group, List<int> profit) {
    int mod = 1000000007;
    int m = group.length;

    List<List<int>> dp =
        List.generate(n + 1, (_) => List.filled(minProfit + 1, 0));

    dp[0][0] = 1;

    for (int i = 0; i < m; i++) {
      int g = group[i];
      int p = profit[i];

      for (int members = n; members >= g; members--) {
        for (int prof = minProfit; prof >= 0; prof--) {
          int newProfit = (prof + p > minProfit) ? minProfit : prof + p;

          dp[members][newProfit] =
              (dp[members][newProfit] + dp[members - g][prof]) % mod;
        }
      }
    }

    int result = 0;
    for (int i = 0; i <= n; i++) {
      result = (result + dp[i][minProfit]) % mod;
    }

    return result;
  }
}