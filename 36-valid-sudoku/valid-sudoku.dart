class Solution {
  bool isValidSudoku(List<List<String>> board) {
    Set<String> seen = {};

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        String current = board[i][j];

        if (current == '.') continue;

        String rowKey = "row$i-$current";
        String colKey = "col$j-$current";
        String boxKey = "box${i ~/ 3}${j ~/ 3}-$current";

        if (seen.contains(rowKey) ||
            seen.contains(colKey) ||
            seen.contains(boxKey)) {
          return false;
        }

        seen.add(rowKey);
        seen.add(colKey);
        seen.add(boxKey);
      }
    }

    return true;
  }
}