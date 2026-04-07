class Solution {
  List<List<int>> updateMatrix(List<List<int>> mat) {
    int m = mat.length;
    int n = mat[0].length;

    List<List<int>> dist = List.generate(
        m, (_) => List.filled(n, -1));

    List<List<int>> queue = [];

    // push all 0s
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 0) {
          dist[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    List<List<int>> dirs = [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ];

    int head = 0;

    while (head < queue.length) {
      var cur = queue[head++];
      int x = cur[0], y = cur[1];

      for (var d in dirs) {
        int nx = x + d[0];
        int ny = y + d[1];

        if (nx >= 0 &&
            ny >= 0 &&
            nx < m &&
            ny < n &&
            dist[nx][ny] == -1) {
          dist[nx][ny] = dist[x][y] + 1;
          queue.add([nx, ny]);
        }
      }
    }

    return dist;
  }
}