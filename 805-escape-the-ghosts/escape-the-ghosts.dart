class Solution {
  bool escapeGhosts(List<List<int>> ghosts, List<int> target) {
    int tx = target[0];
    int ty = target[1];

    int dist(int x1, int y1, int x2, int y2) {
      return (x1 - x2).abs() + (y1 - y2).abs();
    }

    int playerDist = dist(0, 0, tx, ty);

    for (var g in ghosts) {
      int ghostDist = dist(g[0], g[1], tx, ty);

      if (ghostDist <= playerDist) {
        return false;
      }
    }

    return true;
  }
}