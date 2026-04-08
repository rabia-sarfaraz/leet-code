import 'dart:collection';

class Solution {
  int cutOffTree(List<List<int>> forest) {
    int m = forest.length;
    int n = forest[0].length;

    List<List<int>> trees = [];

    // collect all trees (height > 1)
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (forest[i][j] > 1) {
          trees.add([forest[i][j], i, j]);
        }
      }
    }

    // sort by height
    trees.sort((a, b) => a[0] - b[0]);

    int sr = 0, sc = 0;
    int totalSteps = 0;

    for (var tree in trees) {
      int steps = _bfs(forest, sr, sc, tree[1], tree[2]);
      if (steps == -1) return -1;

      totalSteps += steps;
      sr = tree[1];
      sc = tree[2];
    }

    return totalSteps;
  }

  int _bfs(List<List<int>> forest, int sr, int sc, int tr, int tc) {
    int m = forest.length;
    int n = forest[0].length;

    List<List<int>> dirs = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    Queue<List<int>> q = Queue();
    Set<String> visited = {};

    q.add([sr, sc]);
    visited.add("$sr,$sc");

    int steps = 0;

    while (q.isNotEmpty) {
      int size = q.length;

      for (int i = 0; i < size; i++) {
        var cur = q.removeFirst();
        int r = cur[0], c = cur[1];

        if (r == tr && c == tc) return steps;

        for (var d in dirs) {
          int nr = r + d[0];
          int nc = c + d[1];

          if (nr >= 0 &&
              nr < m &&
              nc >= 0 &&
              nc < n &&
              forest[nr][nc] != 0 &&
              !visited.contains("$nr,$nc")) {
            visited.add("$nr,$nc");
            q.add([nr, nc]);
          }
        }
      }

      steps++;
    }

    return -1;
  }
}