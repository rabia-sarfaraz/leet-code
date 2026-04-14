import 'dart:collection';

class Solution {
  int shortestPathBinaryMatrix(List<List<int>> grid) {
    int n = grid.length;

    if (grid[0][0] == 1 || grid[n - 1][n - 1] == 1) return -1;

    List<List<int>> dirs = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1],           [0, 1],
      [1, -1],  [1, 0],  [1, 1],
    ];

    Queue<List<int>> q = Queue();
    q.add([0, 0]);

    grid[0][0] = 1; // visited + distance

    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int x = cur[0], y = cur[1];

      int dist = grid[x][y];

      if (x == n - 1 && y == n - 1) {
        return dist;
      }

      for (var d in dirs) {
        int nx = x + d[0];
        int ny = y + d[1];

        if (nx >= 0 &&
            ny >= 0 &&
            nx < n &&
            ny < n &&
            grid[nx][ny] == 0) {
          grid[nx][ny] = dist + 1;
          q.add([nx, ny]);
        }
      }
    }

    return -1;
  }
}