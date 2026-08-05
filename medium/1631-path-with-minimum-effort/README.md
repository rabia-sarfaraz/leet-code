# Path With Minimum Effort

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.

Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

 
Example 1:



Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
Output: 2
Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.


Example 2:



Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
Output: 1
Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].


Example 3:

Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
Output: 0
Explanation: This route does not require any effort.


 
Constraints:


	rows == heights.length
	columns == heights[i].length
	1 <= rows, columns <= 100
	1 <= heights[i][j] <= 106

## Solution

**Language:** dart  
**Runtime:** 226 ms (beats 100.00%)  
**Memory:** 162 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:28:41.486Z  

```dart
import 'dart:collection';

class Solution {
  int minimumEffortPath(List<List<int>> heights) {
    int m = heights.length;
    int n = heights[0].length;

    bool canReach(int limit) {
      Queue<List<int>> q = Queue();
      List<List<bool>> vis =
          List.generate(m, (_) => List.filled(n, false));

      q.add([0, 0]);
      vis[0][0] = true;

      List<List<int>> dirs = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
      ];

      while (q.isNotEmpty) {
        var cur = q.removeFirst();
        int x = cur[0];
        int y = cur[1];

        if (x == m - 1 && y == n - 1) return true;

        for (var d in dirs) {
          int nx = x + d[0];
          int ny = y + d[1];

          if (nx < 0 || nx >= m || ny < 0 || ny >= n) continue;
          if (vis[nx][ny]) continue;

          if ((heights[x][y] - heights[nx][ny]).abs() <= limit) {
            vis[nx][ny] = true;
            q.add([nx, ny]);
          }
        }
      }

      return false;
    }

    int low = 0;
    int high = 1000000;

    while (low < high) {
      int mid = low + ((high - low) >> 1);

      if (canReach(mid)) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/path-with-minimum-effort/)