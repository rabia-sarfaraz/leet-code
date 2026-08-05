# Rank Transform of a Matrix

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given an m x n matrix, return a new matrix answer where answer[row][col] is the rank of matrix[row][col].

The rank is an integer that represents how large an element is compared to other elements. It is calculated using the following rules:


	The rank is an integer starting from 1.
	If two elements p and q are in the same row or column, then:
	
		If p < q then rank(p) < rank(q)
		If p == q then rank(p) == rank(q)
		If p > q then rank(p) > rank(q)
	
	
	The rank should be as small as possible.


The test cases are generated so that answer is unique under the given rules.

 
Example 1:

Input: matrix = [[1,2],[3,4]]
Output: [[1,2],[2,3]]
Explanation:
The rank of matrix[0][0] is 1 because it is the smallest integer in its row and column.
The rank of matrix[0][1] is 2 because matrix[0][1] > matrix[0][0] and matrix[0][0] is rank 1.
The rank of matrix[1][0] is 2 because matrix[1][0] > matrix[0][0] and matrix[0][0] is rank 1.
The rank of matrix[1][1] is 3 because matrix[1][1] > matrix[0][1], matrix[1][1] > matrix[1][0], and both matrix[0][1] and matrix[1][0] are rank 2.


Example 2:

Input: matrix = [[7,7],[7,7]]
Output: [[1,1],[1,1]]


Example 3:

Input: matrix = [[20,-21,14],[-19,4,19],[22,-47,24],[-19,4,19]]
Output: [[4,2,3],[1,3,4],[5,1,6],[1,3,4]]


 
Constraints:


	m == matrix.length
	n == matrix[i].length
	1 <= m, n <= 500
	-109 <= matrix[row][col] <= 109

## Solution

**Language:** dart  
**Runtime:** 391 ms (beats 100.00%)  
**Memory:** 258.3 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:31:31.774Z  

```dart
class Solution {
  List<List<int>> matrixRankTransform(List<List<int>> matrix) {
    int m = matrix.length, n = matrix[0].length;
    List<List<int>> ans =
        List.generate(m, (_) => List.filled(n, 0));

    List<int> rowRank = List.filled(m, 0);
    List<int> colRank = List.filled(n, 0);

    Map<int, List<List<int>>> groups = {};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        groups.putIfAbsent(matrix[i][j], () => []).add([i, j]);
      }
    }

    List<int> values = groups.keys.toList()..sort();

    for (int value in values) {
      Map<int, int> parent = {};

      int rowNode(int r) => r;
      int colNode(int c) => c + m;

      int find(int x) {
        parent.putIfAbsent(x, () => x);
        if (parent[x] != x) {
          parent[x] = find(parent[x]!);
        }
        return parent[x]!;
      }

      void union(int a, int b) {
        int pa = find(a);
        int pb = find(b);
        if (pa != pb) parent[pa] = pb;
      }

      for (var cell in groups[value]!) {
        union(rowNode(cell[0]), colNode(cell[1]));
      }

      Map<int, List<List<int>>> comps = {};
      for (var cell in groups[value]!) {
        int root = find(rowNode(cell[0]));
        comps.putIfAbsent(root, () => []).add(cell);
      }

      for (var cells in comps.values) {
        int rank = 0;
        for (var cell in cells) {
          rank = rank > rowRank[cell[0]] ? rank : rowRank[cell[0]];
          rank = rank > colRank[cell[1]] ? rank : colRank[cell[1]];
        }
        rank++;

        for (var cell in cells) {
          ans[cell[0]][cell[1]] = rank;
        }
        for (var cell in cells) {
          rowRank[cell[0]] = rank;
          colRank[cell[1]] = rank;
        }
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/rank-transform-of-a-matrix/)