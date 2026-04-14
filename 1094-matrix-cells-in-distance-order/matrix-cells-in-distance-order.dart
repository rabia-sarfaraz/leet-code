class Solution {
  List<List<int>> allCellsDistOrder(int rows, int cols, int rCenter, int cCenter) {
    List<List<int>> res = [];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        res.add([i, j]);
      }
    }

    res.sort((a, b) {
      int d1 = (a[0] - rCenter).abs() + (a[1] - cCenter).abs();
      int d2 = (b[0] - rCenter).abs() + (b[1] - cCenter).abs();
      return d1.compareTo(d2);
    });

    return res;
  }
}