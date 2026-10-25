# Number of Closed Islands

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given a 2D `grid` consists of `0s` (land) and `1s` (water).  An *island* is a maximal 4-directionally connected group of `0s` and a *closed island* is an island **totally** (all left, top, right, bottom) surrounded by `1s.`

Return the number of *closed islands*.

 

**Example 1:**

```
Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
Output: 2
Explanation: 
Islands in gray are closed because they are completely surrounded by water (group of 1s).
```

**Example 2:**

```
Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
Output: 1

```

**Example 3:**

```
Input: grid = [[1,1,1,1,1,1,1],
               [1,0,0,0,0,0,1],
               [1,0,1,1,1,0,1],
               [1,0,1,0,1,0,1],
               [1,0,1,1,1,0,1],
               [1,0,0,0,0,0,1],
               [1,1,1,1,1,1,1]]
Output: 2

```

 

**Constraints:**

- 1 <= grid.length, grid[0].length <= 100
- 0 <= grid[i][j] <=1

## Solution

**Language:** dart  
**Runtime:** 2 ms (beats 100.00%)  
**Memory:** 151.2 MB  
**Submitted:** 2026-10-25T05:39:30.067Z  

```dart
class Solution {
  int closedIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    void dfs(int r, int c) {
      if (r < 0 || r >= m || c < 0 || c >= n) return;
      if (grid[r][c] == 1) return;

      grid[r][c] = 1;

      dfs(r - 1, c);
      dfs(r + 1, c);
      dfs(r, c - 1);
      dfs(r, c + 1);
    }

    for (int i = 0; i < m; i++) {
      dfs(i, 0);
      dfs(i, n - 1);
    }

    for (int j = 0; j < n; j++) {
      dfs(0, j);
      dfs(m - 1, j);
    }

    int count = 0;

    for (int i = 1; i < m - 1; i++) {
      for (int j = 1; j < n - 1; j++) {
        if (grid[i][j] == 0) {
          count++;
          dfs(i, j);
        }
      }
    }

    return count;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-closed-islands/)