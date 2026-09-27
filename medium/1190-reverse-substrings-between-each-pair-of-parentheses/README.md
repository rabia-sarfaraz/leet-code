# Reverse Substrings Between Each Pair of Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a string `s` that consists of lower case English letters and brackets.

Reverse the strings in each pair of matching parentheses, starting from the innermost one.

Your result should **not** contain any brackets.

 

**Example 1:**

```
Input: s = "(abcd)"
Output: "dcba"

```

**Example 2:**

```
Input: s = "(u(love)i)"
Output: "iloveu"
Explanation: The substring "love" is reversed first, then the whole string is reversed.

```

**Example 3:**

```
Input: s = "(ed(et(oc))el)"
Output: "leetcode"
Explanation: First, we reverse the substring "oc", then "etco", and finally, the whole string.

```

 

**Constraints:**

- 1 <= s.length <= 2000
- s only contains lower case English characters and parentheses.
- It is guaranteed that all parentheses are balanced.

## Solution

**Language:** dart  
**Runtime:** 7 ms (beats 100.00%)  
**Memory:** 147.7 MB (beats 100.00%)  
**Submitted:** 2026-09-27T02:08:54.003Z  

```dart
class Solution {
  String reverseParentheses(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == ')') {
        List<String> temp = [];

        while (stack.isNotEmpty && stack.last != '(') {
          temp.add(stack.removeLast());
        }

        // '(' remove karo
        stack.removeLast();

        // Reversed part wapas stack mein
        stack.addAll(temp);
      } else {
        stack.add(ch);
      }
    }

    return stack.join();
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/)