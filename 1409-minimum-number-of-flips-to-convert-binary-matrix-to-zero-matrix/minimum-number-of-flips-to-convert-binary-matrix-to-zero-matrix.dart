class Solution {
  int m = 0, n = 0;

  List<List<int>> dirs = [
    [0, 0],
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ];

  int minFlips(List<List<int>> mat) {
    m = mat.length;
    n = mat[0].length;

    int start = 0;

    // encode matrix into bitmask
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1) {
          start |= (1 << (i * n + j));
        }
      }
    }

    Set<int> visited = {};
    List<List<int>> q = [
      [start, 0]
    ];

    visited.add(start);

    while (q.isNotEmpty) {
      var cur = q.removeAt(0);
      int state = cur[0];
      int steps = cur[1];

      if (state == 0) return steps;

      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          int newState = state;

          for (var d in dirs) {
            int x = i + d[0];
            int y = j + d[1];

            if (x >= 0 && y >= 0 && x < m && y < n) {
              int pos = x * n + y;
              newState ^= (1 << pos);
            }
          }

          if (!visited.contains(newState)) {
            visited.add(newState);
            q.add([newState, steps + 1]);
          }
        }
      }
    }

    return -1;
  }
}