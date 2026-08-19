# Cinema Seat Allocation

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A cinema has n rows of seats, numbered from 1 to n. Each row has 10 seats, numbered from 1 to 10.

You are given a 2D integer array reservedSeats, where reservedSeats[i] = [rowi, seati] means that seat seati in row rowi is already reserved.

A four-person group must be assigned to four seats in the same row. The group can be seated in one of the following seat blocks:


	seats 2, 3, 4, 5
	seats 4, 5, 6, 7
	seats 6, 7, 8, 9


A block can be used only if none of its seats are reserved. Each seat can be assigned to at most one group.

Return an integer denoting the maximum number of four-person groups that can be assigned.

 
Example 1:



Input: n = 3, reservedSeats = [[1,2],[1,3],[1,8],[2,6],[3,1],[3,10]]
Output: 4
Explanation: The figure above shows an optimal allocation of four groups. Seats marked in blue are already reserved, and each set of four contiguous seats marked in orange is assigned to one group.


Example 2:

Input: n = 2, reservedSeats = [[2,1],[1,8],[2,6]]
Output: 2


Example 3:

Input: n = 4, reservedSeats = [[4,3],[1,4],[4,6],[1,7]]
Output: 4


 
Constraints:


	1 <= n <= 109
	1 <= reservedSeats.length <= min(10 * n, 104)
	reservedSeats[i] == [rowi, seati]
	1 <= rowi <= n
	1 <= seati <= 10
	All reservedSeats[i] are distinct.

## Solution

**Language:** dart  
**Runtime:** 17 ms (beats 100.00%)  
**Memory:** 182.3 MB (beats 100.00%)  
**Submitted:** 2026-08-19T04:46:24.764Z  

```dart
class Solution {
  int maxNumberOfFamilies(int n, List<List<int>> reservedSeats) {
    Map<int, int> rows = {};

    // Store reserved seats for each row using a bitmask
    for (var seat in reservedSeats) {
      int row = seat[0];
      int col = seat[1];

      if (col >= 2 && col <= 9) {
        rows[row] = (rows[row] ?? 0) | (1 << col);
      }
    }

    int answer = (n - rows.length) * 2;

    for (var mask in rows.values) {
      bool left = (mask & ((1 << 2) | (1 << 3) | (1 << 4) | (1 << 5))) == 0;
      bool middle = (mask & ((1 << 4) | (1 << 5) | (1 << 6) | (1 << 7))) == 0;
      bool right = (mask & ((1 << 6) | (1 << 7) | (1 << 8) | (1 << 9))) == 0;

      if (left && right) {
        answer += 2;
      } else if (left || middle || right) {
        answer += 1;
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/cinema-seat-allocation/)