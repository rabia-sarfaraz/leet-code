# Count Substrings That Differ by One Character

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given two strings s and t, find the number of ways you can choose a non-empty substring of s and replace a single character by a different character such that the resulting substring is a substring of t. In other words, find the number of substrings in s that differ from some substring in t by exactly one character.

For example, the underlined substrings in "computer" and "computation" only differ by the 'e'/'a', so this is a valid way.

Return the number of substrings that satisfy the condition above.

A substring is a contiguous sequence of characters within a string.

 
Example 1:

Input: s = "aba", t = "baba"
Output: 6
Explanation: The following are the pairs of substrings from s and t that differ by exactly 1 character:
("aba", "baba")
("aba", "baba")
("aba", "baba")
("aba", "baba")
("aba", "baba")
("aba", "baba")
The underlined portions are the substrings that are chosen from s and t.

​​Example 2:

Input: s = "ab", t = "bb"
Output: 3
Explanation: The following are the pairs of substrings from s and t that differ by 1 character:
("ab", "bb")
("ab", "bb")
("ab", "bb")
​​​​The underlined portions are the substrings that are chosen from s and t.


 
Constraints:


	1 <= s.length, t.length <= 100
	s and t consist of lowercase English letters only.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 150.1 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:35:22.479Z  

```dart
class Solution {
  int countSubstrings(String s, String t) {
    int m = s.length;
    int n = t.length;
    int ans = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int diff = 0;
        int x = i, y = j;

        while (x < m && y < n) {
          if (s[x] != t[y]) diff++;
          if (diff > 1) break;
          if (diff == 1) ans++;
          x++;
          y++;
        }
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/count-substrings-that-differ-by-one-character/)