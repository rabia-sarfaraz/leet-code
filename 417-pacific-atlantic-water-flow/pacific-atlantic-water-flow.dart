class Solution {
  List<List<int>> pacificAtlantic(List<List<int>> heights) {
    int m = heights.length;
    int n = heights[0].length;

    List<List<bool>> pacific = List.generate(m, (_) => List.filled(n, false));
    List<List<bool>> atlantic = List.generate(m, (_) => List.filled(n, false));

    void dfs(int r, int c, List<List<bool>> visited) {
      visited[r][c] = true;

      List<List<int>> dirs = [
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1]
      ];

      for (var d in dirs) {
        int nr = r + d[0];
        int nc = c + d[1];

        if (nr < 0 || nc < 0 || nr >= m || nc >= n) continue;
        if (visited[nr][nc]) continue;

        // water can flow only if next height >= current
        if (heights[nr][nc] >= heights[r][c]) {
          dfs(nr, nc, visited);
        }
      }
    }

    // Pacific: top row + left column
    for (int i = 0; i < m; i++) {
      dfs(i, 0, pacific);
    }
    for (int j = 0; j < n; j++) {
      dfs(0, j, pacific);
    }

    // Atlantic: bottom row + right column
    for (int i = 0; i < m; i++) {
      dfs(i, n - 1, atlantic);
    }
    for (int j = 0; j < n; j++) {
      dfs(m - 1, j, atlantic);
    }

    List<List<int>> result = [];

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (pacific[i][j] && atlantic[i][j]) {
          result.add([i, j]);
        }
      }
    }

    return result;
  }
}