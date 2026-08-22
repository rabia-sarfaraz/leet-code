# Largest Submatrix With Rearrangements

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a binary matrix matrix of size m x n, and you are allowed to rearrange the columns of the matrix in any order.

Return the area of the largest submatrix within matrix where every element of the submatrix is 1 after reordering the columns optimally.

 
Example 1:

Input: matrix = [[0,0,1],[1,1,1],[1,0,1]]
Output: 4
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 4.


Example 2:

Input: matrix = [[1,0,1,0,1]]
Output: 3
Explanation: You can rearrange the columns as shown above.
The largest submatrix of 1s, in bold, has an area of 3.


Example 3:

Input: matrix = [[1,1,0],[1,0,1]]
Output: 2
Explanation: Notice that you must rearrange entire columns, and there is no way to make a submatrix of 1s larger than an area of 2.


 
Constraints:


	m == matrix.length
	n == matrix[i].length
	1 <= m * n <= 105
	matrix[i][j] is either 0 or 1.

## Solution

**Language:** dart  
**Runtime:** 82 ms (beats 100.00%)  
**Memory:** 216.5 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:42:21.976Z  

```dart
class Solution {
  int largestSubmatrix(List<List<int>> matrix) {
    int rows = matrix.length;
    int cols = matrix[0].length;
    int ans = 0;

    List<int> height = List.filled(cols, 0);

    for (int i = 0; i < rows; i++) {
      // Har column ki consecutive 1s ki height
      for (int j = 0; j < cols; j++) {
        if (matrix[i][j] == 1) {
          height[j]++;
        } else {
          height[j] = 0;
        }
      }

      // Current row ki heights sort karo
      List<int> sorted = List.from(height);
      sorted.sort((a, b) => b.compareTo(a));

      // Largest possible rectangle
      for (int j = 0; j < cols; j++) {
        int area = sorted[j] * (j + 1);
        ans = ans > area ? ans : area;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/largest-submatrix-with-rearrangements/)