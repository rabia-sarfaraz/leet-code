# Count Islands With Total Value Divisible by K

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an `m x n` matrix `grid` and a positive integer `k`. An **island** is a group of **positive** integers (representing land) that are **4-directionally** connected (horizontally or vertically).

The **total value** of an island is the sum of the values of all cells in the island.

Return the number of islands with a total value **divisible by** `k`.

 

**Example 1:**

**Input:** grid = [[0,2,1,0,0],[0,5,0,0,5],[0,0,1,0,0],[0,1,4,7,0],[0,2,0,0,8]], k = 5

**Output:** 2

**Explanation:**

The grid contains four islands. The islands highlighted in blue have a total value that is divisible by 5, while the islands highlighted in red do not.

**Example 2:**

**Input:** grid = [[3,0,3,0], [0,3,0,3], [3,0,3,0]], k = 3

**Output:** 6

**Explanation:**

The grid contains six islands, each with a total value that is divisible by 3.

 

**Constraints:**

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 1000
- 1 <= m * n <= 105
- 0 <= grid[i][j] <= 106
- 1 <= k <= 106

## Solution

**Language:** dart  
**Runtime:** 27 ms (beats 100.00%)  
**Memory:** 190.1 MB (beats 100.00%)  
**Submitted:** 2026-10-26T05:05:52.705Z  

```dart

class Solution {
  int countIslands(List<List<int>> grid, int k) {
    int m = grid.length;
    int n = grid[0].length;
    int count = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] <= 0) continue;

        int sum = 0;
        List<int> stack = [i * n + j];

        while (stack.isNotEmpty) {
          int cell = stack.removeLast();
          int r = cell ~/ n;
          int c = cell % n;

          if (grid[r][c] <= 0) continue;

          sum += grid[r][c];
          grid[r][c] = 0;

          if (r > 0 && grid[r - 1][c] > 0) {
            stack.add((r - 1) * n + c);
          }
          if (r + 1 < m && grid[r + 1][c] > 0) {
            stack.add((r + 1) * n + c);
          }
          if (c > 0 && grid[r][c - 1] > 0) {
            stack.add(r * n + c - 1);
          }
          if (c + 1 < n && grid[r][c + 1] > 0) {
            stack.add(r * n + c + 1);
          }
        }

        if (sum % k == 0) count++;
      }
    }

    return count;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/count-islands-with-total-value-divisible-by-k/)