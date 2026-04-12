class Solution {
  int minDeletionSize(List<String> strs) {
    int n = strs.length;
    int m = strs[0].length;

    int count = 0;

    for (int col = 0; col < m; col++) {
      for (int row = 1; row < n; row++) {
        if (strs[row][col].compareTo(strs[row - 1][col]) < 0) {
          count++;
          break;
        }
      }
    }

    return count;
  }
}