class Solution {
  bool exist(List<List<String>> board, String word) {
    int rows = board.length;
    int cols = board[0].length;

    bool dfs(int r, int c, int index) {
      // pura word mil gaya
      if (index == word.length) return true;

      // out of bounds ya match na ho
      if (r < 0 ||
          c < 0 ||
          r >= rows ||
          c >= cols ||
          board[r][c] != word[index]) {
        return false;
      }

      // visited mark
      String temp = board[r][c];
      board[r][c] = "#";

      // 4 directions
      bool found = dfs(r + 1, c, index + 1) ||
          dfs(r - 1, c, index + 1) ||
          dfs(r, c + 1, index + 1) ||
          dfs(r, c - 1, index + 1);

      // backtrack (restore)
      board[r][c] = temp;

      return found;
    }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (dfs(i, j, 0)) return true;
      }
    }

    return false;
  }
}