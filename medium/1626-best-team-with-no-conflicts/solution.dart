class Solution {
  int bestTeamScore(List<int> scores, List<int> ages) {
    int n = scores.length;

    List<List<int>> players = [];
    for (int i = 0; i < n; i++) {
      players.add([ages[i], scores[i]]);
    }

    players.sort((a, b) {
      if (a[0] != b[0]) return a[0] - b[0];
      return a[1] - b[1];
    });

    List<int> dp = List.filled(n, 0);
    int ans = 0;

    for (int i = 0; i < n; i++) {
      dp[i] = players[i][1];
      for (int j = 0; j < i; j++) {
        if (players[j][1] <= players[i][1]) {
          dp[i] = dp[i] > dp[j] + players[i][1]
              ? dp[i]
              : dp[j] + players[i][1];
        }
      }
      ans = ans > dp[i] ? ans : dp[i];
    }

    return ans;
  }
}