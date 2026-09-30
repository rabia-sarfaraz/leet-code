# Longest Palindromic Substring

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given a string `s`, return *the longest* *palindromic* *substring* in `s`.

 

**Example 1:**

```
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

```

**Example 2:**

```
Input: s = "cbbd"
Output: "bb"

```

 

**Constraints:**

- 1 <= s.length <= 1000
- s consist of only digits and English letters.

## Solution

**Language:** dart  
**Runtime:** 5 ms (beats 100.00%)  
**Memory:** 147.8 MB (beats 82.54%)  
**Submitted:** 2026-09-30T04:38:36.234Z  

```dart
class Solution {
  String longestPalindrome(String s) {
    if (s.length < 2) return s;

    int start = 0;
    int end = 0;

    for (int i = 0; i < s.length; i++) {
      int len1 = _expand(s, i, i);       // Odd length
      int len2 = _expand(s, i, i + 1);   // Even length

      int len = len1 > len2 ? len1 : len2;

      if (len > end - start + 1) {
        start = i - (len - 1) ~/ 2;
        end = i + len ~/ 2;
      }
    }

    return s.substring(start, end + 1);
  }

  int _expand(String s, int left, int right) {
    while (left >= 0 &&
        right < s.length &&
        s[left] == s[right]) {
      left--;
      right++;
    }

    return right - left - 1;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/longest-palindromic-substring/)