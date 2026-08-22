class Solution {
  bool canMouseWin(List<String> grid, int catJump, int mouseJump) {
    int rows = grid.length;
    int cols = grid[0].length;
    int n = rows * cols;

    int mouseStart = -1;
    int catStart = -1;
    int food = -1;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int p = r * cols + c;

        if (grid[r][c] == 'M') mouseStart = p;
        if (grid[r][c] == 'C') catStart = p;
        if (grid[r][c] == 'F') food = p;
      }
    }

    List<int> dr = [1, -1, 0, 0];
    List<int> dc = [0, 0, 1, -1];

    List<List<int>> moves = List.generate(n, (_) => []);

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == '#') continue;

        int p = r * cols + c;
        moves[p].add(p);

        for (int d = 0; d < 4; d++) {
          for (int step = 1; step <= mouseJump || step <= catJump; step++) {
            int nr = r + dr[d] * step;
            int nc = c + dc[d] * step;

            if (nr < 0 ||
                nr >= rows ||
                nc < 0 ||
                nc >= cols ||
                grid[nr][nc] == '#') {
              break;
            }

            moves[p].add(nr * cols + nc);
          }
        }
      }
    }

    // State:
    // mouse position, cat position, turn
    //
    // 0 = unknown
    // 1 = mouse wins
    // 2 = cat wins
    Map<String, int> memo = {};
    int maxTurns = 100;

    int dfs(int mouse, int cat, int turn) {
      if (turn >= maxTurns) return 2;

      if (mouse == food) return 1;
      if (cat == food || cat == mouse) return 2;

      String key = '$mouse,$cat,$turn';
      if (memo.containsKey(key)) return memo[key]!;

      bool mouseTurn = turn % 2 == 0;

      if (mouseTurn) {
        int r = mouse ~/ cols;
        int c = mouse % cols;

        // Mouse can stay or move up to mouseJump
        for (int d = 0; d < 4; d++) {
          for (int step = 0; step <= mouseJump; step++) {
            int nr = r + dr[d] * step;
            int nc = c + dc[d] * step;

            if (step == 0) {
              nr = r;
              nc = c;
            }

            if (nr < 0 ||
                nr >= rows ||
                nc < 0 ||
                nc >= cols ||
                grid[nr][nc] == '#') {
              break;
            }

            int nextMouse = nr * cols + nc;

            if (dfs(nextMouse, cat, turn + 1) == 1) {
              memo[key] = 1;
              return 1;
            }
          }
        }

        memo[key] = 2;
        return 2;
      } else {
        int r = cat ~/ cols;
        int c = cat % cols;

        // Cat can stay or move up to catJump
        for (int d = 0; d < 4; d++) {
          for (int step = 0; step <= catJump; step++) {
            int nr = r + dr[d] * step;
            int nc = c + dc[d] * step;

            if (step == 0) {
              nr = r;
              nc = c;
            }

            if (nr < 0 ||
                nr >= rows ||
                nc < 0 ||
                nc >= cols ||
                grid[nr][nc] == '#') {
              break;
            }

            int nextCat = nr * cols + nc;

            if (dfs(mouse, nextCat, turn + 1) == 2) {
              memo[key] = 2;
              return 2;
            }
          }
        }

        memo[key] = 1;
        return 1;
      }
    }

    return dfs(mouseStart, catStart, 0) == 1;
  }
}