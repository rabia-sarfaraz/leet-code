import 'dart:collection';

class Solution {
  int shortestPathAllKeys(List<String> grid) {
    int n = grid.length;
    int m = grid[0].length;

    int startX = 0, startY = 0;
    int keyCount = 0;

    // find start + count keys
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        String ch = grid[i][j];
        if (ch == '@') {
          startX = i;
          startY = j;
        } else if (ch.codeUnitAt(0) >= 97 && ch.codeUnitAt(0) <= 102) {
          keyCount++;
        }
      }
    }

    int allKeys = (1 << keyCount) - 1;

    List<List<List<bool>>> visited = List.generate(
      n,
      (_) => List.generate(m, (_) => List.filled(1 << keyCount, false)),
    );

    Queue<List<int>> q = Queue();
    q.add([startX, startY, 0, 0]); // x, y, mask, steps
    visited[startX][startY][0] = true;

    List<int> dx = [-1, 1, 0, 0];
    List<int> dy = [0, 0, -1, 1];

    while (q.isNotEmpty) {
      var cur = q.removeFirst();
      int x = cur[0], y = cur[1], mask = cur[2], steps = cur[3];

      if (mask == allKeys) return steps;

      for (int d = 0; d < 4; d++) {
        int nx = x + dx[d];
        int ny = y + dy[d];

        if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;

        String cell = grid[nx][ny];

        // wall
        if (cell == '#') continue;

        int newMask = mask;

        // if key
        if (cell.codeUnitAt(0) >= 97 && cell.codeUnitAt(0) <= 102) {
          newMask |= (1 << (cell.codeUnitAt(0) - 97));
        }

        // if lock
        if (cell.codeUnitAt(0) >= 65 && cell.codeUnitAt(0) <= 70) {
          if ((mask & (1 << (cell.codeUnitAt(0) - 65))) == 0) {
            continue;
          }
        }

        if (!visited[nx][ny][newMask]) {
          visited[nx][ny][newMask] = true;
          q.add([nx, ny, newMask, steps + 1]);
        }
      }
    }

    return -1;
  }
}