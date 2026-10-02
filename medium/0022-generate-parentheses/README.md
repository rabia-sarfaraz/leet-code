# Generate Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given `n` pairs of parentheses, write a function to *generate all combinations of well-formed parentheses*.

 

**Example 1:**

```
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

```

**Example 2:**

```
Input: n = 1
Output: ["()"]

```

 

**Constraints:**

- 1 <= n <= 8

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 149.8 MB (beats 50.00%)  
**Submitted:** 2026-10-02T02:11:09.992Z  

```dart
class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = [];

    void backtrack(String current, int open, int close) {
      if (current.length == 2 * n) {
        result.add(current);
        return;
      }

      // Opening bracket add kar sakte hain
      if (open < n) {
        backtrack(current + '(', open + 1, close);
      }

      // Closing bracket tabhi jab open brackets zyada hon
      if (close < open) {
        backtrack(current + ')', open, close + 1);
      }
    }

    backtrack('', 0, 0);

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/generate-parentheses/)