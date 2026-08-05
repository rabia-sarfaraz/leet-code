class Solution {
  List<List<int>> matrixRankTransform(List<List<int>> matrix) {
    int m = matrix.length, n = matrix[0].length;
    List<List<int>> ans =
        List.generate(m, (_) => List.filled(n, 0));

    List<int> rowRank = List.filled(m, 0);
    List<int> colRank = List.filled(n, 0);

    Map<int, List<List<int>>> groups = {};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        groups.putIfAbsent(matrix[i][j], () => []).add([i, j]);
      }
    }

    List<int> values = groups.keys.toList()..sort();

    for (int value in values) {
      Map<int, int> parent = {};

      int rowNode(int r) => r;
      int colNode(int c) => c + m;

      int find(int x) {
        parent.putIfAbsent(x, () => x);
        if (parent[x] != x) {
          parent[x] = find(parent[x]!);
        }
        return parent[x]!;
      }

      void union(int a, int b) {
        int pa = find(a);
        int pb = find(b);
        if (pa != pb) parent[pa] = pb;
      }

      for (var cell in groups[value]!) {
        union(rowNode(cell[0]), colNode(cell[1]));
      }

      Map<int, List<List<int>>> comps = {};
      for (var cell in groups[value]!) {
        int root = find(rowNode(cell[0]));
        comps.putIfAbsent(root, () => []).add(cell);
      }

      for (var cells in comps.values) {
        int rank = 0;
        for (var cell in cells) {
          rank = rank > rowRank[cell[0]] ? rank : rowRank[cell[0]];
          rank = rank > colRank[cell[1]] ? rank : colRank[cell[1]];
        }
        rank++;

        for (var cell in cells) {
          ans[cell[0]][cell[1]] = rank;
        }
        for (var cell in cells) {
          rowRank[cell[0]] = rank;
          colRank[cell[1]] = rank;
        }
      }
    }

    return ans;
  }
}