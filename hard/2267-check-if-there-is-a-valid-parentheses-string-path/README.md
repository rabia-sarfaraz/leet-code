# Check if There Is a Valid Parentheses String Path

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

A parentheses string is a **non-empty** string consisting only of `'('` and `')'`. It is **valid** if **any** of the following conditions is **true**:

- It is ().
- It can be written as AB (A concatenated with B), where A and B are valid parentheses strings.
- It can be written as (A), where A is a valid parentheses string.

You are given an `m x n` matrix of parentheses `grid`. A **valid parentheses string path** in the grid is a path satisfying **all** of the following conditions:

- The path starts from the upper left cell (0, 0).
- The path ends at the bottom-right cell (m - 1, n - 1).
- The path only ever moves down or right.
- The resulting parentheses string formed by the path is valid.

Return `true` *if there exists a **valid parentheses string path** in the grid.* Otherwise, return `false`.

 

**Example 1:**

```
Input: grid = [["(","(","("],[")","(",")"],["(","(",")"],["(","(",")"]]
Output: true
Explanation: The above diagram shows two possible paths that form valid parentheses strings.
The first path shown results in the valid parentheses string "()(())".
The second path shown results in the valid parentheses string "((()))".
Note that there may be other valid parentheses string paths.

```

**Example 2:**

```
Input: grid = [[")",")"],["(","("]]
Output: false
Explanation: The two possible paths form the parentheses strings "))(" and ")((". Since neither of them are valid parentheses strings, we return false.

```

 

**Constraints:**

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 100
- grid[i][j] is either '(' or ')'.

## Solution

**Language:** dart  
**Runtime:** 38 ms (beats 100.00%)  
**Memory:** 198.2 MB (beats 100.00%)  
**Submitted:** 2026-09-29T04:45:35.033Z  

```dart
class Solution {
  late List<List<String>> grid;
  late int m;
  late int n;
  late List<List<List<int>>> memo;

  bool hasValidPath(List<List<String>> grid) {
    this.grid = grid;
    m = grid.length;
    n = grid[0].length;

    // Total path length odd hona chahiye.
    if ((m + n - 1) % 2 == 1) {
      return false;
    }

    // Start '(' aur end ')' hona zaroori hai.
    if (grid[0][0] == ')' || grid[m - 1][n - 1] == '(') {
      return false;
    }

    memo = List.generate(
      m,
      (_) => List.generate(
        n,
        (_) => List.filled(m + n, -1),
      ),
    );

    return _dfs(0, 0, 0);
  }

  bool _dfs(int r, int c, int balance) {
    if (r >= m || c >= n) {
      return false;
    }

    balance += grid[r][c] == '(' ? 1 : -1;

    // Kabhi bhi ')' zyada ho jaye to invalid.
    if (balance < 0) {
      return false;
    }

    if (memo[r][c][balance] != -1) {
      return memo[r][c][balance] == 1;
    }

    // Destination par balance exactly 0 hona chahiye.
    if (r == m - 1 && c == n - 1) {
      return balance == 0;
    }

    bool result =
        _dfs(r + 1, c, balance) ||
        _dfs(r, c + 1, balance);

    memo[r][c][balance] = result ? 1 : 0;

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/check-if-there-is-a-valid-parentheses-string-path/)