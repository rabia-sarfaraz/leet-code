class Solution {
  int largestIsland(List<List<int>> grid) {
    int n = grid.length;
    Map<int, int> area = {};
    int index = 2; // start from 2 (0,1 already used)

    // DFS to mark island and calculate area
    int dfs(int r, int c, int idx) {
      if (r < 0 || c < 0 || r >= n || c >= n || grid[r][c] != 1) {
        return 0;
      }

      grid[r][c] = idx;
      int res = 1;

      res += dfs(r + 1, c, idx);
      res += dfs(r - 1, c, idx);
      res += dfs(r, c + 1, idx);
      res += dfs(r, c - 1, idx);

      return res;
    }

    // Step 1: label islands
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          area[index] = dfs(i, j, index);
          index++;
        }
      }
    }

    int maxArea = 0;

    // already max island
    for (var val in area.values) {
      if (val > maxArea) maxArea = val;
    }

    // Step 2: try converting 0 -> 1
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 0) {
          Set<int> seen = {};
          int total = 1;

          List<List<int>> dirs = [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1]
          ];

          for (var d in dirs) {
            int nr = i + d[0];
            int nc = j + d[1];

            if (nr >= 0 && nc >= 0 && nr < n && nc < n) {
              int idx = grid[nr][nc];
              if (idx > 1 && !seen.contains(idx)) {
                total += area[idx]!;
                seen.add(idx);
              }
            }
          }

          if (total > maxArea) maxArea = total;
        }
      }
    }

    // edge case: all 1s
    return maxArea == 0 ? n * n : maxArea;
  }
}