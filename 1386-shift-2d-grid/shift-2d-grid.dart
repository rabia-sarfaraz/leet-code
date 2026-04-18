class Solution {
  List<List<int>> shiftGrid(List<List<int>> grid, int k) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> flat = [];

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        flat.add(grid[i][j]);
      }
    }

    int len = flat.length;
    k = k % len;

    List<int> rotated = [
      ...flat.sublist(len - k),
      ...flat.sublist(0, len - k)
    ];

    List<List<int>> result =
        List.generate(m, (_) => List.filled(n, 0));

    int idx = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        result[i][j] = rotated[idx++];
      }
    }

    return result;
  }
}