
class Solution {
  int minimumChanges(String s, int k) {
    int n = s.length;
    const int inf = 1000000000;

    List<List<int>> cost = List.generate(
      n,
      (_) => List.filled(n, inf),
    );

    // Calculate minimum changes for every substring
    for (int len = 2; len <= n; len++) {
      for (int l = 0; l + len <= n; l++) {
        int r = l + len - 1;

        for (int d = 1; d < len; d++) {
          if (len % d != 0) continue;

          int groups = len ~/ d;
          int changes = 0;

          for (int offset = 0; offset < d; offset++) {
            for (int j = 0; j < groups ~/ 2; j++) {
              int a = l + offset + j * d;
              int b = l + offset + (groups - 1 - j) * d;

              if (s[a] != s[b]) {
                changes++;
              }
            }
          }

          if (changes < cost[l][r]) {
            cost[l][r] = changes;
          }
        }
      }
    }

    // Dynamic Programming
    List<List<int>> dp = List.generate(
      k + 1,
      (_) => List.filled(n + 1, inf),
    );

    dp[0][0] = 0;

    for (int groups = 1; groups <= k; groups++) {
      for (int end = groups * 2; end <= n; end++) {
        for (int start = (groups - 1) * 2;
            start <= end - 2;
            start++) {

          if (dp[groups - 1][start] == inf) continue;

          int current = dp[groups - 1][start] +
              cost[start][end - 1];

          if (current < dp[groups][end]) {
            dp[groups][end] = current;
          }
        }
      }
    }

    return dp[k][n];
  }
}
