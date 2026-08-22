class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    int m = isWater.length;
    int n = isWater[0].length;

    List<List<int>> height =
        List.generate(m, (_) => List.filled(n, -1));

    List<List<int>> queue = [];
    int front = 0;

    // Saare water cells ko starting points banao
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (isWater[i][j] == 1) {
          height[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    List<int> dr = [1, -1, 0, 0];
    List<int> dc = [0, 0, 1, -1];

    // Multi-source BFS
    while (front < queue.length) {
      int r = queue[front][0];
      int c = queue[front][1];
      front++;

      for (int d = 0; d < 4; d++) {
        int nr = r + dr[d];
        int nc = c + dc[d];

        if (nr < 0 ||
            nr >= m ||
            nc < 0 ||
            nc >= n ||
            height[nr][nc] != -1) {
          continue;
        }

        height[nr][nc] = height[r][c] + 1;
        queue.add([nr, nc]);
      }
    }

    return height;
  }
}