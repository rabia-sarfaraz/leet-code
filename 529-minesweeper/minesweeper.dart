class Solution {
  List<List<String>> updateBoard(List<List<String>> board, List<int> click) {
    int m = board.length;
    int n = board[0].length;

    List<List<int>> dirs = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1],          [0, 1],
      [1, -1], [1, 0], [1, 1]
    ];

    bool inBounds(int x, int y) => x >= 0 && x < m && y >= 0 && y < n;

    String countMines(int x, int y) {
      int count = 0;

      for (var d in dirs) {
        int nx = x + d[0];
        int ny = y + d[1];

        if (inBounds(nx, ny) && board[nx][ny] == 'M') {
          count++;
        }
      }

      return count.toString();
    }

    void dfs(int x, int y) {
      if (!inBounds(x, y) || board[x][y] != 'E') return;

      int mines = int.parse(countMines(x, y));

      if (mines > 0) {
        board[x][y] = mines.toString();
        return;
      }

      board[x][y] = 'B';

      for (var d in dirs) {
        dfs(x + d[0], y + d[1]);
      }
    }

    int cx = click[0], cy = click[1];

    if (board[cx][cy] == 'M') {
      board[cx][cy] = 'X';
      return board;
    }

    dfs(cx, cy);
    return board;
  }
}