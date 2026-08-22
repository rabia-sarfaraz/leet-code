# Cat and Mouse II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

A game is played by a cat and a mouse named Cat and Mouse.

The environment is represented by a grid of size rows x cols, where each element is a wall, floor, player (Cat, Mouse), or food.


	Players are represented by the characters 'C'(Cat),'M'(Mouse).
	Floors are represented by the character '.' and can be walked on.
	Walls are represented by the character '#' and cannot be walked on.
	Food is represented by the character 'F' and can be walked on.
	There is only one of each character 'C', 'M', and 'F' in grid.


Mouse and Cat play according to the following rules:


	Mouse moves first, then they take turns to move.
	During each turn, Cat and Mouse can jump in one of the four directions (left, right, up, down). They cannot jump over the wall nor outside of the grid.
	catJump, mouseJump are the maximum lengths Cat and Mouse can jump at a time, respectively. Cat and Mouse can jump less than the maximum length.
	Staying in the same position is allowed.
	Mouse can jump over Cat.


The game can end in 4 ways:


	If Cat occupies the same position as Mouse, Cat wins.
	If Cat reaches the food first, Cat wins.
	If Mouse reaches the food first, Mouse wins.
	If Mouse cannot get to the food within 1000 turns, Cat wins.


Given a rows x cols matrix grid and two integers catJump and mouseJump, return true if Mouse can win the game if both Cat and Mouse play optimally, otherwise return false.

 
Example 1:

Input: grid = ["####F","#C...","M...."], catJump = 1, mouseJump = 2
Output: true
Explanation: Cat cannot catch Mouse on its turn nor can it get the food before Mouse.


Example 2:

Input: grid = ["M.C...F"], catJump = 1, mouseJump = 4
Output: true


Example 3:

Input: grid = ["M.C...F"], catJump = 1, mouseJump = 3
Output: false


 
Constraints:


	rows == grid.length
	cols = grid[i].length
	1 <= rows, cols <= 8
	grid[i][j] consist only of characters 'C', 'M', 'F', '.', and '#'.
	There is only one of each character 'C', 'M', and 'F' in grid.
	1 <= catJump, mouseJump <= 8

## Solution

**Language:** dart  
**Runtime:** 1802 ms (beats 100.00%)  
**Memory:** 325.8 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:42:55.940Z  

```dart
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
```

---

[View on LeetCode](https://leetcode.com/problems/cat-and-mouse-ii/)