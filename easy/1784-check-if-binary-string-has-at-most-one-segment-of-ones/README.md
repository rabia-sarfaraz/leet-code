# Check if Binary String Has at Most One Segment of Ones

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given a binary string s ​​​​​without leading zeros, return true​​​ if s contains at most one contiguous segment of ones. Otherwise, return false.

 
Example 1:

Input: s = "1001"
Output: false
Explanation: The string has two segments of size 1.


Example 2:

Input: s = "110"
Output: true

 
Constraints:


	1 <= s.length <= 100
	s[i]​​​​ is either '0' or '1'.
	s[0] is '1'.

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 151.4 MB  
**Submitted:** 2026-08-23T05:31:47.502Z  

```dart
class Solution {
  bool checkOnesSegment(String s) {
    bool seenZero = false;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '0') {
        seenZero = true;
      } else if (seenZero) {
        return false;
      }
    }

    return true;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/)