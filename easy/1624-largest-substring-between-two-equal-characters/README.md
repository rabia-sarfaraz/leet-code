# Largest Substring Between Two Equal Characters

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

 
Example 1:

Input: s = "aa"
Output: 0
Explanation: The optimal substring here is an empty substring between the two 'a's.

Example 2:

Input: s = "abca"
Output: 2
Explanation: The optimal substring here is "bc".


Example 3:

Input: s = "cbzxy"
Output: -1
Explanation: There are no characters that appear twice in s.


 
Constraints:


	1 <= s.length <= 300
	s contains only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 3 ms (beats 100.00%)  
**Memory:** 148.1 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:05:35.254Z  

```dart
class Solution {
  int maxLengthBetweenEqualCharacters(String s) {
    Map<String, int> first = {};
    int ans = -1;

    for (int i = 0; i < s.length; i++) {
      if (!first.containsKey(s[i])) {
        first[s[i]] = i;
      } else {
        ans = ans > (i - first[s[i]]! - 1)
            ? ans
            : (i - first[s[i]]! - 1);
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/largest-substring-between-two-equal-characters/)