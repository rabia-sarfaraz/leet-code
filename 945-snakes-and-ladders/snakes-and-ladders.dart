import 'dart:collection';

class Solution {
  int snakesAndLadders(List<List<int>> board) {
    int n = board.length;

    // Convert board index to row, col
    List<int> getPos(int num) {
      int r = (num - 1) ~/ n;
      int c = (num - 1) % n;

      if (r % 2 == 1) {
        c = n - 1 - c;
      }

      r = n - 1 - r;
      return [r, c];
    }

    Queue<List<int>> queue = Queue();
    queue.add([1, 0]); // [cell, moves]

    Set<int> visited = {1};

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      int cell = current[0];
      int moves = current[1];

      if (cell == n * n) return moves;

      for (int i = 1; i <= 6; i++) {
        int next = cell + i;
        if (next > n * n) break;

        var pos = getPos(next);
        int r = pos[0], c = pos[1];

        if (board[r][c] != -1) {
          next = board[r][c];
        }

        if (!visited.contains(next)) {
          visited.add(next);
          queue.add([next, moves + 1]);
        }
      }
    }

    return -1;
  }
}