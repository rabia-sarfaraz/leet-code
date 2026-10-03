# Longest Valid Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a string containing just the characters `'('` and `')'`, return *the length of the longest valid (well-formed) parentheses **substring*.

 

**Example 1:**

```
Input: s = "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()".

```

**Example 2:**

```
Input: s = ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()".

```

**Example 3:**

```
Input: s = ""
Output: 0

```

 

**Constraints:**

- 0 <= s.length <= 3 * 104
- s[i] is '(', or ')'.

## Solution

**Language:** dart  
**Runtime:** 4 ms (beats 100.00%)  
**Memory:** 148.7 MB (beats 81.82%)  
**Submitted:** 2026-10-03T07:09:59.474Z  

```dart
class Solution {
  int longestValidParentheses(String s) {
    List<int> stack = [-1];
    int maxLength = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(i);
      } else {
        stack.removeLast();

        if (stack.isEmpty) {
          // Invalid ')' ki new boundary
          stack.add(i);
        } else {
          int length = i - stack.last;
          if (length > maxLength) {
            maxLength = length;
          }
        }
      }
    }

    return maxLength;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/longest-valid-parentheses/)