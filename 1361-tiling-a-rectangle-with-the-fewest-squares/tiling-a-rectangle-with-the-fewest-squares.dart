class Solution {
  int ans = 100000;

  int tilingRectangle(int n, int m) {
    List<List<bool>> grid =
        List.generate(n, (_) => List.filled(m, false));

    _dfs(grid, n, m, 0);
    return ans;
  }

  void _dfs(List<List<bool>> grid, int n, int m, int count) {
    if (count >= ans) return;

    int r = -1, c = -1;

    // find first empty cell
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (!grid[i][j]) {
          r = i;
          c = j;
          break;
        }
      }
      if (r != -1) break;
    }

    // fully filled
    if (r == -1) {
      ans = count < ans ? count : ans;
      return;
    }

    int maxSize = _getMaxSize(grid, n, m, r, c);

    for (int size = maxSize; size >= 1; size--) {
      _fill(grid, r, c, size, true);
      _dfs(grid, n, m, count + 1);
      _fill(grid, r, c, size, false);
    }
  }

  int _getMaxSize(List<List<bool>> grid, int n, int m, int r, int c) {
    int maxSize = 0;

    for (int size = 1; r + size <= n && c + size <= m; size++) {
      bool ok = true;

      for (int i = r; i < r + size; i++) {
        for (int j = c; j < c + size; j++) {
          if (grid[i][j]) {
            ok = false;
            break;
          }
        }
        if (!ok) break;
      }

      if (!ok) break;
      maxSize = size;
    }

    return maxSize;
  }

  void _fill(List<List<bool>> grid, int r, int c, int size, bool val) {
    for (int i = r; i < r + size; i++) {
      for (int j = c; j < c + size; j++) {
        grid[i][j] = val;
      }
    }
  }
}