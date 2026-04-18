class Solution {
  int minPushBox(List<List<String>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> box = [];
    List<int> target = [];
    List<int> player = [];

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 'B') box = [i, j];
        if (grid[i][j] == 'T') target = [i, j];
        if (grid[i][j] == 'S') player = [i, j];
      }
    }

    List<List<int>> dirs = [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ];

    bool inBounds(int x, int y) {
      return x >= 0 && y >= 0 && x < m && y < n && grid[x][y] != '#';
    }

    bool canReach(List<List<String>> g, int sx, int sy, int tx, int ty,
        List<int> boxPos) {
      List<List<bool>> vis =
          List.generate(m, (_) => List.filled(n, false));

      List<List<int>> q = [
        [sx, sy]
      ];
      vis[sx][sy] = true;

      while (q.isNotEmpty) {
        var cur = q.removeAt(0);
        if (cur[0] == tx && cur[1] == ty) return true;

        for (var d in dirs) {
          int nx = cur[0] + d[0];
          int ny = cur[1] + d[1];

          if (inBounds(nx, ny) &&
              !vis[nx][ny] &&
              !(nx == boxPos[0] && ny == boxPos[1])) {
            vis[nx][ny] = true;
            q.add([nx, ny]);
          }
        }
      }

      return false;
    }

    List<List<int>> q = [
      [box[0], box[1], player[0], player[1], 0]
    ];

    Set<String> visited = {};

    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      int bx = cur[0], by = cur[1];
      int px = cur[2], py = cur[3];
      int pushes = cur[4];

      if (bx == target[0] && by == target[1]) {
        return pushes;
      }

      String key = "$bx,$by,$px,$py";
      if (visited.contains(key)) continue;
      visited.add(key);

      for (var d in dirs) {
        int nbx = bx + d[0];
        int nby = by + d[1];

        int pxNeed = bx - d[0];
        int pyNeed = by - d[1];

        if (!inBounds(nbx, nby) || !inBounds(pxNeed, pyNeed)) continue;

        if (canReach(grid, px, py, pxNeed, pyNeed, [bx, by])) {
          q.add([nbx, nby, bx, by, pushes + 1]);
        }
      }
    }

    return -1;
  }
}