import 'dart:collection';

class Solution {
  int minimumEffortPath(List<List<int>> heights) {
    int m = heights.length;
    int n = heights[0].length;

    bool canReach(int limit) {
      Queue<List<int>> q = Queue();
      List<List<bool>> vis =
          List.generate(m, (_) => List.filled(n, false));

      q.add([0, 0]);
      vis[0][0] = true;

      List<List<int>> dirs = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
      ];

      while (q.isNotEmpty) {
        var cur = q.removeFirst();
        int x = cur[0];
        int y = cur[1];

        if (x == m - 1 && y == n - 1) return true;

        for (var d in dirs) {
          int nx = x + d[0];
          int ny = y + d[1];

          if (nx < 0 || nx >= m || ny < 0 || ny >= n) continue;
          if (vis[nx][ny]) continue;

          if ((heights[x][y] - heights[nx][ny]).abs() <= limit) {
            vis[nx][ny] = true;
            q.add([nx, ny]);
          }
        }
      }

      return false;
    }

    int low = 0;
    int high = 1000000;

    while (low < high) {
      int mid = low + ((high - low) >> 1);

      if (canReach(mid)) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }
}