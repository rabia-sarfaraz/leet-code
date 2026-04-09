import 'dart:collection';

class Solution {
  int slidingPuzzle(List<List<int>> board) {
    String start = '';
    for (var row in board) {
      for (var num in row) {
        start += num.toString();
      }
    }

    String target = "123450";

    Map<String, List<int>> moves = {
      "0": [1, 3],
      "1": [0, 2, 4],
      "2": [1, 5],
      "3": [0, 4],
      "4": [1, 3, 5],
      "5": [2, 4],
    };

    Queue<String> q = Queue();
    Set<String> visited = {};

    q.add(start);
    visited.add(start);

    int steps = 0;

    while (q.isNotEmpty) {
      int size = q.length;

      for (int i = 0; i < size; i++) {
        String cur = q.removeFirst();

        if (cur == target) return steps;

        int zeroIndex = cur.indexOf('0');

        for (int next in moves[zeroIndex.toString()]!) {
          List<String> chars = cur.split('');

          // swap 0 with next
          String temp = chars[zeroIndex];
          chars[zeroIndex] = chars[next];
          chars[next] = temp;

          String newState = chars.join('');

          if (!visited.contains(newState)) {
            visited.add(newState);
            q.add(newState);
          }
        }
      }

      steps++;
    }

    return -1;
  }
}