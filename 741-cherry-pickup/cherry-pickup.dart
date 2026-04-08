class Solution {
  late List<List<int>> grid;
  late List<List<List<int>>> memo;
  int n = 0;

  int cherryPickup(List<List<int>> grid) {
    this.grid = grid;
    n = grid.length;

    memo = List.generate(
      n,
      (_) => List.generate(
        n,
        (_) => List.filled(n, -999999),
      ),
    );

    int ans = _dfs(0, 0, 0);
    return ans < 0 ? 0 : ans;
  }

  int _dfs(int r1, int c1, int r2) {
    int c2 = r1 + c1 - r2;

    if (r1 >= n || c1 >= n || r2 >= n || c2 >= n) return -999999;
    if (grid[r1][c1] == -1 || grid[r2][c2] == -1) return -999999;

    if (r1 == n - 1 && c1 == n - 1) {
      return grid[r1][c1];
    }

    if (memo[r1][c1][r2] != -999999) {
      return memo[r1][c1][r2];
    }

    int cherries = grid[r1][c1];
    if (r1 != r2 || c1 != c2) {
      cherries += grid[r2][c2];
    }

    int best = -999999;

    best = _max(best, _dfs(r1 + 1, c1, r2 + 1));
    best = _max(best, _dfs(r1, c1 + 1, r2));
    best = _max(best, _dfs(r1 + 1, c1, r2));
    best = _max(best, _dfs(r1, c1 + 1, r2 + 1));

    cherries += best;

    memo[r1][c1][r2] = cherries;
    return cherries;
  }

  int _max(int a, int b) => a > b ? a : b;
}