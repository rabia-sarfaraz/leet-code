class Solution {
  late List<List<String>> grid;
  late int m;
  late int n;
  late List<List<List<int>>> memo;

  bool hasValidPath(List<List<String>> grid) {
    this.grid = grid;
    m = grid.length;
    n = grid[0].length;

    // Total path length odd hona chahiye.
    if ((m + n - 1) % 2 == 1) {
      return false;
    }

    // Start '(' aur end ')' hona zaroori hai.
    if (grid[0][0] == ')' || grid[m - 1][n - 1] == '(') {
      return false;
    }

    memo = List.generate(
      m,
      (_) => List.generate(
        n,
        (_) => List.filled(m + n, -1),
      ),
    );

    return _dfs(0, 0, 0);
  }

  bool _dfs(int r, int c, int balance) {
    if (r >= m || c >= n) {
      return false;
    }

    balance += grid[r][c] == '(' ? 1 : -1;

    // Kabhi bhi ')' zyada ho jaye to invalid.
    if (balance < 0) {
      return false;
    }

    if (memo[r][c][balance] != -1) {
      return memo[r][c][balance] == 1;
    }

    // Destination par balance exactly 0 hona chahiye.
    if (r == m - 1 && c == n - 1) {
      return balance == 0;
    }

    bool result =
        _dfs(r + 1, c, balance) ||
        _dfs(r, c + 1, balance);

    memo[r][c][balance] = result ? 1 : 0;

    return result;
  }
}