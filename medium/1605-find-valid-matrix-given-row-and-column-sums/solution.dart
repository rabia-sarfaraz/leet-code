class Solution {
  List<List<int>> restoreMatrix(List<int> rowSum, List<int> colSum) {
    int m = rowSum.length;
    int n = colSum.length;

    List<List<int>> ans =
        List.generate(m, (_) => List.filled(n, 0));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int val = rowSum[i] < colSum[j] ? rowSum[i] : colSum[j];
        ans[i][j] = val;
        rowSum[i] -= val;
        colSum[j] -= val;
      }
    }

    return ans;
  }
}