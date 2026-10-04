# Valid Parenthesis String

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given a string `s` containing only three types of characters: `'('`, `')'` and `'*'`, return `true` *if* `s` *is **valid***.

The following rules define a **valid** string:

- Any left parenthesis '(' must have a corresponding right parenthesis ')'.
- Any right parenthesis ')' must have a corresponding left parenthesis '('.
- Left parenthesis '(' must go before the corresponding right parenthesis ')'.
- '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".

 

**Example 1:**

```
Input: s = "()"
Output: true

```

**Example 2:**

```
Input: s = "(*)"
Output: true

```

**Example 3:**

```
Input: s = "(*))"
Output: true

```

**Example 4:**

```
Input: s = "("
Output: false

```

 

**Constraints:**

- 1 <= s.length <= 100
- s[i] is '(', ')' or '*'.

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 149.1 MB  
**Submitted:** 2026-10-04T05:25:06.494Z  

```dart
class Solution {
  bool checkValidString(String s) {
    int minOpen = 0;
    int maxOpen = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        minOpen++;
        maxOpen++;
      } else if (s[i] == ')') {
        minOpen--;
        maxOpen--;
      } else {
        // '*' ko ')' ya '(' dono tarah use kar sakte hain
        minOpen--;
        maxOpen++;
      }

      // Minimum negative ho sakta hai, kyun ke '*' empty bhi ho sakta hai
      if (minOpen < 0) {
        minOpen = 0;
      }

      // Agar maximum negative ho gaya to valid nahi ho sakta
      if (maxOpen < 0) {
        return false;
      }
    }

    return minOpen == 0;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/valid-parenthesis-string/)