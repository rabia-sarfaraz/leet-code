class Solution {
  int oddCells(int m, int n, List<List<int>> indices) {
    List<int> row = List.filled(m, 0);
    List<int> col = List.filled(n, 0);

    for (var op in indices) {
      row[op[0]]++;
      col[op[1]]++;
    }

    int count = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if ((row[i] + col[j]) % 2 == 1) {
          count++;
        }
      }
    }

    return count;
  }
}