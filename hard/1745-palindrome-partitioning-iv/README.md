# Palindrome Partitioning IV

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a string s, return true if it is possible to split the string s into three non-empty palindromic substrings. Otherwise, return false.​​​​​

A string is said to be palindrome if it the same string when reversed.

 
Example 1:

Input: s = "abcbdd"
Output: true
Explanation: "abcbdd" = "a" + "bcb" + "dd", and all three substrings are palindromes.


Example 2:

Input: s = "bcbddxy"
Output: false
Explanation: s cannot be split into 3 palindromes.


 
Constraints:


	3 <= s.length <= 2000
	s​​​​​​ consists only of lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 121 ms (beats 100.00%)  
**Memory:** 206.1 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:54:04.687Z  

```dart
class Solution {
  bool checkPartitioning(String s) {
    int n = s.length;

    // palindrome[i][j] = s[i...j] palindrome hai ya nahi
    List<List<bool>> palindrome =
        List.generate(n, (_) => List.filled(n, false));

    for (int i = n - 1; i >= 0; i--) {
      for (int j = i; j < n; j++) {
        if (s[i] == s[j] &&
            (j - i <= 2 || palindrome[i + 1][j - 1])) {
          palindrome[i][j] = true;
        }
      }
    }

    // Exactly 3 non-empty parts
    for (int i = 0; i < n - 2; i++) {
      if (!palindrome[0][i]) continue;

      for (int j = i + 1; j < n - 1; j++) {
        if (palindrome[i + 1][j] &&
            palindrome[j + 1][n - 1]) {
          return true;
        }
      }
    }

    return false;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/palindrome-partitioning-iv/)