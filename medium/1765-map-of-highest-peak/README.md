# Map of Highest Peak

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer matrix isWater of size m x n that represents a map of land and water cells.


	If isWater[i][j] == 0, cell (i, j) is a land cell.
	If isWater[i][j] == 1, cell (i, j) is a water cell.


You must assign each cell a height in a way that follows these rules:


	The height of each cell must be non-negative.
	If the cell is a water cell, its height must be 0.
	Any two adjacent cells must have an absolute height difference of at most 1. A cell is adjacent to another cell if the former is directly north, east, south, or west of the latter (i.e., their sides are touching).


Find an assignment of heights such that the maximum height in the matrix is maximized.

Return an integer matrix height of size m x n where height[i][j] is cell (i, j)'s height. If there are multiple solutions, return any of them.

 
Example 1:



Input: isWater = [[0,1],[0,0]]
Output: [[1,0],[2,1]]
Explanation: The image shows the assigned heights of each cell.
The blue cell is the water cell, and the green cells are the land cells.


Example 2:



Input: isWater = [[0,0,1],[1,0,0],[0,0,0]]
Output: [[1,1,0],[0,1,1],[1,2,2]]
Explanation: A height of 2 is the maximum possible height of any assignment.
Any height assignment that has a maximum height of 2 while still meeting the rules will also be accepted.


 
Constraints:


	m == isWater.length
	n == isWater[i].length
	1 <= m, n <= 1000
	isWater[i][j] is 0 or 1.
	There is at least one water cell.


 
Note: This question is the same as 542: https://leetcode.com/problems/01-matrix/

## Solution

**Language:** dart  
**Runtime:** 147 ms (beats 100.00%)  
**Memory:** 333.1 MB (beats 100.00%)  
**Submitted:** 2026-08-22T04:03:35.076Z  

```dart
class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    int m = isWater.length;
    int n = isWater[0].length;

    List<List<int>> height =
        List.generate(m, (_) => List.filled(n, -1));

    List<List<int>> queue = [];
    int front = 0;

    // Saare water cells ko starting points banao
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (isWater[i][j] == 1) {
          height[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    List<int> dr = [1, -1, 0, 0];
    List<int> dc = [0, 0, 1, -1];

    // Multi-source BFS
    while (front < queue.length) {
      int r = queue[front][0];
      int c = queue[front][1];
      front++;

      for (int d = 0; d < 4; d++) {
        int nr = r + dr[d];
        int nc = c + dc[d];

        if (nr < 0 ||
            nr >= m ||
            nc < 0 ||
            nc >= n ||
            height[nr][nc] != -1) {
          continue;
        }

        height[nr][nc] = height[r][c] + 1;
        queue.add([nr, nc]);
      }
    }

    return height;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/map-of-highest-peak/)