class Solution {
  int maxDistance(List<List<int>> grid) {
    int n = grid.length;
    List<List<int>> queue = [];

    // Step 1: push all land cells into queue
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          queue.add([i, j]);
        }
      }
    }

    // edge case: all water or all land
    if (queue.isEmpty || queue.length == n * n) return -1;

    int dirs = 4;
    List<List<int>> directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    int distance = -1;

    // BFS
    while (queue.isNotEmpty) {
      int size = queue.length;
      distance++;

      for (int i = 0; i < size; i++) {
        var cell = queue.removeAt(0);

        for (var d in directions) {
          int x = cell[0] + d[0];
          int y = cell[1] + d[1];

          if (x >= 0 &&
              y >= 0 &&
              x < n &&
              y < n &&
              grid[x][y] == 0) {
            grid[x][y] = 1;
            queue.add([x, y]);
          }
        }
      }
    }

    return distance;
  }
}