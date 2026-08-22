# Longest Nice Substring

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

A string s is nice if, for every letter of the alphabet that s contains, it appears both in uppercase and lowercase. For example, "abABB" is nice because 'A' and 'a' appear, and 'B' and 'b' appear. However, "abA" is not because 'b' appears, but 'B' does not.

Given a string s, return the longest substring of s that is nice. If there are multiple, return the substring of the earliest occurrence. If there are none, return an empty string.

 
Example 1:

Input: s = "YazaAay"
Output: "aAa"
Explanation: "aAa" is a nice string because 'A/a' is the only letter of the alphabet in s, and both 'A' and 'a' appear.
"aAa" is the longest nice substring.


Example 2:

Input: s = "Bb"
Output: "Bb"
Explanation: "Bb" is a nice string because both 'B' and 'b' appear. The whole string is a substring.


Example 3:

Input: s = "c"
Output: ""
Explanation: There are no nice substrings.


 
Constraints:


	1 <= s.length <= 100
	s consists of uppercase and lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 13 ms (beats 50.00%)  
**Memory:** 151.2 MB (beats 50.00%)  
**Submitted:** 2026-08-22T04:02:27.809Z  

```dart
class Solution {
  String longestNiceSubstring(String s) {
    if (s.length < 2) return '';

    Set<String> chars = s.split('').toSet();

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (!chars.contains(c.toLowerCase()) ||
          !chars.contains(c.toUpperCase())) {
        String left = longestNiceSubstring(s.substring(0, i));
        String right = longestNiceSubstring(s.substring(i + 1));

        return left.length >= right.length ? left : right;
      }
    }

    return s;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/longest-nice-substring/)