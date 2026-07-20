class Solution {
  List<List<int>> shiftGrid(List<List<int>> grid, int k) {
    int m = grid.length;
    int n = grid[0].length;
    int total = m * n;

    k %= total;

    List<List<int>> ans =
        List.generate(m, (_) => List.filled(n, 0));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int idx = i * n + j;
        int newIdx = (idx + k) % total;

        int r = newIdx ~/ n;
        int c = newIdx % n;

        ans[r][c] = grid[i][j];
      }
    }

    return ans;
  }
}