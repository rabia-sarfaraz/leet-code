class Solution {
  int knightDialer(int n) {
    const int MOD = 1000000007;

    List<List<int>> moves = [
      [4, 6],     // 0
      [6, 8],     // 1
      [7, 9],     // 2
      [4, 8],     // 3
      [0, 3, 9],  // 4
      [],         // 5 (dead)
      [0, 1, 7],  // 6
      [2, 6],     // 7
      [1, 3],     // 8
      [2, 4],     // 9
    ];

    List<int> dp = List.filled(10, 1);

    for (int step = 2; step <= n; step++) {
      List<int> newDp = List.filled(10, 0);

      for (int i = 0; i < 10; i++) {
        for (int nxt in moves[i]) {
          newDp[nxt] = (newDp[nxt] + dp[i]) % MOD;
        }
      }

      dp = newDp;
    }

    int result = 0;
    for (int val in dp) {
      result = (result + val) % MOD;
    }

    return result;
  }
}