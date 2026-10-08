# Remove Outermost Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

A valid parentheses string is either empty `""`, `"(" + A + ")"`, or `A + B`, where `A` and `B` are valid parentheses strings, and `+` represents string concatenation.

- For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

A valid parentheses string `s` is primitive if it is nonempty, and there does not exist a way to split it into `s = A + B`, with `A` and `B` nonempty valid parentheses strings.

Given a valid parentheses string `s`, consider its primitive decomposition: `s = P1 + P2 + ... + Pk`, where `Pi` are primitive valid parentheses strings.

Return `s` *after removing the outermost parentheses of every primitive string in the primitive decomposition of *`s`.

 

**Example 1:**

```
Input: s = "(()())(())"
Output: "()()()"
Explanation: 
The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
After removing outer parentheses of each part, this is "()()" + "()" = "()()()".

```

**Example 2:**

```
Input: s = "(()())(())(()(()))"
Output: "()()()()(())"
Explanation: 
The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".

```

**Example 3:**

```
Input: s = "()()"
Output: ""
Explanation: 
The input string is "()()", with primitive decomposition "()" + "()".
After removing outer parentheses of each part, this is "" + "" = "".

```

 

**Constraints:**

- 1 <= s.length <= 105
- s[i] is either '(' or ')'.
- s is a valid parentheses string.

## Solution

**Language:** dart  
**Runtime:** 7 ms (beats 100.00%)  
**Memory:** 152.9 MB (beats 8.33%)  
**Submitted:** 2026-10-08T06:55:54.262Z  

```dart
class Solution {
  String removeOuterParentheses(String s) {
    String result = "";
    int depth = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        if (depth > 0) {
          result += '(';
        }
        depth++;
      } else {
        depth--;
        if (depth > 0) {
          result += ')';
        }
      }
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/remove-outermost-parentheses/)