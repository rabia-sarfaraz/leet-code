
class Solution {
  int uniquePaths(List<List<int>> grid) {
    const int mod = 1000000007;

    int m = grid.length;
    int n = grid[0].length;

    List<List<int>> dp = List.generate(
      m,
      (_) => List.filled(n, 0),
    );

    // -2 means unvisited, -1 means invalid path
    List<List<List<int>>> cache = List.generate(
      m,
      (_) => List.generate(
        n,
        (_) => [-2, -2],
      ),
    );

    // Resolve mirror path
    int resolve(int r, int c, int dir) {
      List<List<int>> path = [];

      int result;

      while (true) {
        if (r >= m || c >= n) {
          result = -1;
          break;
        }

        // Reached an empty cell
        if (grid[r][c] == 0) {
          result = r * n + c;
          break;
        }

        // Already calculated
        if (cache[r][c][dir] != -2) {
          result = cache[r][c][dir];
          break;
        }

        path.add([r, c, dir]);

        // Right -> Down, Down -> Right
        if (dir == 0) {
          r++;
          dir = 1;
        } else {
          c++;
          dir = 0;
        }
      }

      // Save calculated result
      for (var state in path) {
        cache[state[0]][state[1]][state[2]] = result;
      }

      return result;
    }

    dp[0][0] = 1;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (dp[i][j] == 0) continue;

        // Move Right
        if (j + 1 < n) {
          int target = resolve(i, j + 1, 0);

          if (target != -1) {
            int r = target ~/ n;
            int c = target % n;

            dp[r][c] = (dp[r][c] + dp[i][j]) % mod;
          }
        }

        // Move Down
        if (i + 1 < m) {
          int target = resolve(i + 1, j, 1);

          if (target != -1) {
            int r = target ~/ n;
            int c = target % n;

            dp[r][c] = (dp[r][c] + dp[i][j]) % mod;
          }
        }
      }
    }

    return dp[m - 1][n - 1];
  }
}
