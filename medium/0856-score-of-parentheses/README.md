# Score of Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given a balanced parentheses string `s`, return *the **score** of the string*.

The **score** of a balanced parentheses string is based on the following rule:

- "()" has score 1.
- AB has score A + B, where A and B are balanced parentheses strings.
- (A) has score 2 * A, where A is a balanced parentheses string.

 

**Example 1:**

```
Input: s = "()"
Output: 1

```

**Example 2:**

```
Input: s = "(())"
Output: 2

```

**Example 3:**

```
Input: s = "()()"
Output: 2

```

 

**Constraints:**

- 2 <= s.length <= 50
- s consists of only '(' and ')'.
- s is a balanced parentheses string.

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 147.1 MB (beats 100.00%)  
**Submitted:** 2026-10-05T03:24:23.532Z  

```dart
class Solution {
  int scoreOfParentheses(String s) {
    List<int> stack = [0];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(0);
      } else {
        int inner = stack.removeLast();

        int score = inner == 0 ? 1 : 2 * inner;

        stack[stack.length - 1] += score;
      }
    }

    return stack[0];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/score-of-parentheses/)