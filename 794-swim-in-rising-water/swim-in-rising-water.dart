import 'dart:collection';

class Solution {
  int swimInWater(List<List<int>> grid) {
    int n = grid.length;

    List<List<int>> dirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    // min-heap using list (manual sort approach)
    List<List<int>> heap = [];
    Set<String> visited = {};

    void push(int time, int r, int c) {
      heap.add([time, r, c]);
      heap.sort((a, b) => a[0].compareTo(b[0])); // min-heap simulation
    }

    push(grid[0][0], 0, 0);
    visited.add("0,0");

    while (heap.isNotEmpty) {
      var cur = heap.removeAt(0);
      int time = cur[0], r = cur[1], c = cur[2];

      if (r == n - 1 && c == n - 1) {
        return time;
      }

      for (var d in dirs) {
        int nr = r + d[0];
        int nc = c + d[1];

        if (nr >= 0 &&
            nc >= 0 &&
            nr < n &&
            nc < n &&
            !visited.contains("$nr,$nc")) {
          visited.add("$nr,$nc");
          push(time > grid[nr][nc] ? time : grid[nr][nc], nr, nc);
        }
      }
    }

    return -1;
  }
}