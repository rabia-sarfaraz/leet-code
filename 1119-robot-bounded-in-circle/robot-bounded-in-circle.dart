class Solution {
  bool isRobotBounded(String instructions) {
    int x = 0, y = 0;

    // 0=N, 1=E, 2=S, 3=W
    int dir = 0;

    List<List<int>> dirs = [
      [0, 1],   // N
      [1, 0],   // E
      [0, -1],  // S
      [-1, 0]   // W
    ];

    for (int i = 0; i < instructions.length; i++) {
      String c = instructions[i];

      if (c == 'G') {
        x += dirs[dir][0];
        y += dirs[dir][1];
      } else if (c == 'L') {
        dir = (dir + 3) % 4; // left turn
      } else if (c == 'R') {
        dir = (dir + 1) % 4; // right turn
      }
    }

    // bounded if back to origin OR not facing north
    return (x == 0 && y == 0) || dir != 0;
  }
}