class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    Set<String> obs = {};

    for (var o in obstacles) {
      obs.add("${o[0]},${o[1]}");
    }

    // directions: N, E, S, W
    List<List<int>> dir = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ];

    int d = 0; // facing north
    int x = 0, y = 0;
    int maxDist = 0;

    for (int c in commands) {
      if (c == -2) {
        d = (d + 3) % 4; // left turn
      } else if (c == -1) {
        d = (d + 1) % 4; // right turn
      } else {
        for (int i = 0; i < c; i++) {
          int nx = x + dir[d][0];
          int ny = y + dir[d][1];

          if (obs.contains("$nx,$ny")) break;

          x = nx;
          y = ny;

          int dist = x * x + y * y;
          if (dist > maxDist) maxDist = dist;
        }
      }
    }

    return maxDist;
  }
}