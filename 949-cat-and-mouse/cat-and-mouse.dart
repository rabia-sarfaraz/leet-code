import 'dart:collection';

class Solution {
  static const int DRAW = 0;
  static const int MOUSE = 1;
  static const int CAT = 2;

  int catMouseGame(List<List<int>> graph) {
    int n = graph.length;

    // color[m][c][t] = result
    List.generate(
        n, (_) => List.generate(n, (_) => List.filled(2, DRAW)));

    List<List<List<int>>> color =
        List.generate(n, (_) => List.generate(n, (_) => List.filled(2, DRAW)));

    List<List<List<int>>> degree =
        List.generate(n, (_) => List.generate(n, (_) => List.filled(2, 0)));

    for (int m = 0; m < n; m++) {
      for (int c = 0; c < n; c++) {
        degree[m][c][0] = graph[m].length;
        degree[m][c][1] =
            graph[c].where((next) => next != 0).length;
      }
    }

    Queue<List<int>> queue = Queue();

    // terminal states
    for (int i = 0; i < n; i++) {
      for (int t = 0; t < 2; t++) {
        if (i != 0) {
          color[0][i][t] = MOUSE;
          queue.add([0, i, t, MOUSE]);

          color[i][i][t] = CAT;
          queue.add([i, i, t, CAT]);
        }
      }
    }

    List<List<int>> parents(int m, int c, int t) {
      List<List<int>> result = [];
      if (t == 0) {
        // mouse turn → previous was cat
        for (int pc in graph[c]) {
          if (pc == 0) continue;
          result.add([m, pc, 1]);
        }
      } else {
        // cat turn → previous was mouse
        for (int pm in graph[m]) {
          result.add([pm, c, 0]);
        }
      }
      return result;
    }

    while (queue.isNotEmpty) {
      var cur = queue.removeFirst();
      int m = cur[0], c = cur[1], t = cur[2], result = cur[3];

      for (var p in parents(m, c, t)) {
        int pm = p[0], pc = p[1], pt = p[2];

        if (color[pm][pc][pt] != DRAW) continue;

        // If current state is winning for player whose turn it is in parent
        if ((pt == 0 && result == MOUSE) ||
            (pt == 1 && result == CAT)) {
          color[pm][pc][pt] = result;
          queue.add([pm, pc, pt, result]);
        } else {
          degree[pm][pc][pt]--;
          if (degree[pm][pc][pt] == 0) {
            int lose = (pt == 0) ? CAT : MOUSE;
            color[pm][pc][pt] = lose;
            queue.add([pm, pc, pt, lose]);
          }
        }
      }
    }

    return color[1][2][0];
  }
}