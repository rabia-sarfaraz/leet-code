# Remove Invalid Parentheses

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a string `s` that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

Return *a list of **unique strings** that are valid with the minimum number of removals*. You may return the answer in **any order**.

 

**Example 1:**

```
Input: s = "()())()"
Output: ["(())()","()()()"]

```

**Example 2:**

```
Input: s = "(a)())()"
Output: ["(a())()","(a)()()"]

```

**Example 3:**

```
Input: s = ")("
Output: [""]

```

 

**Constraints:**

- 1 <= s.length <= 25
- s consists of lowercase English letters and parentheses '(' and ')'.
- There will be at most 20 parentheses in s.

## Solution

**Language:** dart  
**Runtime:** 171 ms  
**Memory:** 154.9 MB  
**Submitted:** 2026-10-07T05:30:20.718Z  

```dart
class Solution {
  List<String> removeInvalidParentheses(String s) {
    List<String> result = [];
    Set<String> visited = {s};
    List<String> queue = [s];

    while (queue.isNotEmpty) {
      String current = queue.removeAt(0);

      if (_isValid(current)) {
        result.add(current);
      }

      // Agar current level par valid answer mil gaya,
      // to aur characters remove nahi karne.
      if (result.isNotEmpty) {
        continue;
      }

      for (int i = 0; i < current.length; i++) {
        if (current[i] != '(' && current[i] != ')') {
          continue;
        }

        String next =
            current.substring(0, i) + current.substring(i + 1);

        if (!visited.contains(next)) {
          visited.add(next);
          queue.add(next);
        }
      }
    }

    return result;
  }

  bool _isValid(String s) {
    int balance = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        balance++;
      } else if (s[i] == ')') {
        balance--;

        if (balance < 0) {
          return false;
        }
      }
    }

    return balance == 0;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/remove-invalid-parentheses/)