# Minimum Add to Make Parentheses Valid

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A parentheses string is valid if and only if:

- It is the empty string,
- It can be written as AB (A concatenated with B), where A and B are valid strings, or
- It can be written as (A), where A is a valid string.

You are given a parentheses string `s`. In one move, you can insert a parenthesis at any position of the string.

- For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".

Return *the minimum number of moves required to make *`s`* valid*.

 

**Example 1:**

```
Input: s = "())"
Output: 1

```

**Example 2:**

```
Input: s = "((("
Output: 3

```

 

**Constraints:**

- 1 <= s.length <= 1000
- s[i] is either '(' or ')'.

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 149.7 MB (beats 66.67%)  
**Submitted:** 2026-10-06T04:15:01.311Z  

```dart
class Solution {
  int minAddToMakeValid(String s) {
    int open = 0;
    int additions = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        open++;
      } else {
        if (open > 0) {
          open--;
        } else {
          additions++;
        }
      }
    }

    return additions + open;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)