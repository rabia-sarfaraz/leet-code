# Minimum Deletions to Make String Balanced

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a string s consisting only of characters 'a' and 'b'​​​​.

You can delete any number of characters in s to make s balanced. s is balanced if there is no pair of indices (i,j) such that i < j and s[i] = 'b' and s[j]= 'a'.

Return the minimum number of deletions needed to make s balanced.

 
Example 1:

Input: s = "aababbab"
Output: 2
Explanation: You can either:
Delete the characters at 0-indexed positions 2 and 6 ("aababbab" -> "aaabbb"), or
Delete the characters at 0-indexed positions 3 and 6 ("aababbab" -> "aabbbb").


Example 2:

Input: s = "bbaaaaabb"
Output: 2
Explanation: The only solution is to delete the first two characters.


 
Constraints:


	1 <= s.length <= 105
	s[i] is 'a' or 'b'​​.

## Solution

**Language:** Python  
**Runtime:** 279 ms (beats 90.29%)  
**Memory:** 12.9 MB (beats 70.87%)  
**Submitted:** 2026-08-05T11:51:57.291Z  

```py
class Solution(object):
    def minimumDeletions(self, s):
        """
        :type s: str
        :rtype: int
        """
        b_count = 0
        deletions = 0

        for ch in s:
            if ch == 'b':
                b_count += 1
            else:
                deletions = min(deletions + 1, b_count)

        return deletions
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/)