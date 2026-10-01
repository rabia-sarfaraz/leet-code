# Valid Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.
- Every close bracket has a corresponding open bracket of the same type.

 

**Example 1:**

**Input:** s = "()"

**Output:** true

**Example 2:**

**Input:** s = "()[]{}"

**Output:** true

**Example 3:**

**Input:** s = "(]"

**Output:** false

**Example 4:**

**Input:** s = "([])"

**Output:** true

**Example 5:**

**Input:** s = "([)]"

**Output:** false

 

**Constraints:**

- 1 <= s.length <= 104
- s consists of parentheses only '()[]{}'.

## Solution

**Language:** dart  
**Runtime:** 3 ms (beats 74.86%)  
**Memory:** 152.4 MB (beats 7.65%)  
**Submitted:** 2026-10-01T02:56:03.137Z  

```dart
class Solution {
  bool isValid(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == '(' || ch == '{' || ch == '[') {
        stack.add(ch);
      } else {
        if (stack.isEmpty) return false;

        String top = stack.removeLast();

        if (ch == ')' && top != '(') return false;
        if (ch == '}' && top != '{') return false;
        if (ch == ']' && top != '[') return false;
      }
    }

    return stack.isEmpty;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/valid-parentheses/)