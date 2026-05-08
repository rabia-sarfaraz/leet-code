class Solution {
  static const int MOD = 1000000007;

  int numberWays(List<List<int>> hats) {
    int n = hats.length;

    // hat -> people who can wear it
    List<List<int>> hatToPeople = List.generate(41, (_) => []);

    for (int person = 0; person < n; person++) {
      for (int hat in hats[person]) {
        hatToPeople[hat].add(person);
      }
    }

    int fullMask = (1 << n) - 1;

    // dp[mask] = ways
    List<int> dp = List.filled(1 << n, 0);
    dp[0] = 1;

    for (int hat = 1; hat <= 40; hat++) {
      List<int> newDp = List.from(dp);

      for (int mask = 0; mask <= fullMask; mask++) {
        if (dp[mask] == 0) continue;

        for (int person in hatToPeople[hat]) {

          // person already has a hat
          if ((mask & (1 << person)) != 0) continue;

          int newMask = mask | (1 << person);

          newDp[newMask] =
              (newDp[newMask] + dp[mask]) % MOD;
        }
      }

      dp = newDp;
    }

    return dp[fullMask];
  }
}