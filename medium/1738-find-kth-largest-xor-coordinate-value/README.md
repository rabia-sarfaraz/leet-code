# Find Kth Largest XOR Coordinate Value

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a 2D matrix of size m x n, consisting of non-negative integers. You are also given an integer k.

The value of coordinate (a, b) of the matrix is the XOR of all matrix[i][j] where 0 <= i <= a < m and 0 <= j <= b < n (0-indexed).

Find the kth largest value (1-indexed) of all the coordinates of matrix.

 
Example 1:

Input: matrix = [[5,2],[1,6]], k = 1
Output: 7
Explanation: The value of coordinate (0,1) is 5 XOR 2 = 7, which is the largest value.


Example 2:

Input: matrix = [[5,2],[1,6]], k = 2
Output: 5
Explanation: The value of coordinate (0,0) is 5 = 5, which is the 2nd largest value.


Example 3:

Input: matrix = [[5,2],[1,6]], k = 3
Output: 4
Explanation: The value of coordinate (1,0) is 5 XOR 1 = 4, which is the 3rd largest value.

 
Constraints:


	m == matrix.length
	n == matrix[i].length
	1 <= m, n <= 1000
	0 <= matrix[i][j] <= 106
	1 <= k <= m * n

## Solution

**Language:** dart  
**Runtime:** 232 ms (beats 100.00%)  
**Memory:** 241.7 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:49:56.213Z  

```dart
class Solution {
  int kthLargestValue(List<List<int>> matrix, int k) {
    int m = matrix.length;
    int n = matrix[0].length;

    List<int> values = [];

    List<List<int>> prefix =
        List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        prefix[i][j] =
            matrix[i - 1][j - 1] ^
            prefix[i - 1][j] ^
            prefix[i][j - 1] ^
            prefix[i - 1][j - 1];

        values.add(prefix[i][j]);
      }
    }

    values.sort((a, b) => b.compareTo(a));

    return values[k - 1];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-kth-largest-xor-coordinate-value/)