class Solution {
  bool validSquare(List<int> p1, List<int> p2, List<int> p3, List<int> p4) {
    List<List<int>> p = [p1, p2, p3, p4];

    Set<int> dist = {};

    for (int i = 0; i < 4; i++) {
      for (int j = i + 1; j < 4; j++) {
        dist.add(_dist(p[i], p[j]));
      }
    }

    // must have exactly 2 different distances:
    // 4 sides + 2 diagonals
    if (dist.length != 2) return false;

    List<int> d = dist.toList()..sort();

    // smaller = side, larger = diagonal
    int side = d[0];
    int diag = d[1];

    // side must be > 0
    return side > 0 && diag == 2 * side;
  }

  int _dist(List<int> a, List<int> b) {
    int dx = a[0] - b[0];
    int dy = a[1] - b[1];
    return dx * dx + dy * dy;
  }
}