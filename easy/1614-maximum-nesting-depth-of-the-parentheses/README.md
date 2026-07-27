# Maximum Nesting Depth of the Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given a valid parentheses string s, return the nesting depth of s. The nesting depth is the maximum number of nested parentheses.

 
Example 1:


Input: s = "(1+(2*3)+((8)/4))+1"

Output: 3

Explanation:

Digit 8 is inside of 3 nested parentheses in the string.


Example 2:


Input: s = "(1)+((2))+(((3)))"

Output: 3

Explanation:

Digit 3 is inside of 3 nested parentheses in the string.


Example 3:


Input: s = "()(())((()()))"

Output: 3


 
Constraints:


	1 <= s.length <= 100
	s consists of digits 0-9 and characters '+', '-', '*', '/', '(', and ')'.
	It is guaranteed that parentheses expression s is a VPS.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 37.50%)  
**Memory:** 147.8 MB (beats 87.50%)  
**Submitted:** 2026-07-27T05:47:06.352Z  

```dart
class Solution {
  int maxDepth(String s) {
    int depth = 0;
    int ans = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        depth++;
        if (depth > ans) ans = depth;
      } else if (s[i] == ')') {
        depth--;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/)