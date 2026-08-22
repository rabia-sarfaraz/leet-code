# Minimum Changes To Make Alternating Binary String

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.

The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.

Return the minimum number of operations needed to make s alternating.

 
Example 1:

Input: s = "0100"
Output: 1
Explanation: If you change the last character to '1', s will be "0101", which is alternating.


Example 2:

Input: s = "10"
Output: 0
Explanation: s is already alternating.


Example 3:

Input: s = "1111"
Output: 2
Explanation: You need two operations to reach "0101" or "1010".


 
Constraints:


	1 <= s.length <= 104
	s[i] is either '0' or '1'.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 150.8 MB (beats 100.00%)  
**Submitted:** 2026-08-22T04:00:03.141Z  

```dart
class Solution {
  int minOperations(String s) {
    int changeStart0 = 0;
    int changeStart1 = 0;

    for (int i = 0; i < s.length; i++) {
      // Pattern: 010101...
      String expected0 = (i % 2 == 0) ? '0' : '1';

      // Pattern: 101010...
      String expected1 = (i % 2 == 0) ? '1' : '0';

      if (s[i] != expected0) {
        changeStart0++;
      }

      if (s[i] != expected1) {
        changeStart1++;
      }
    }

    return changeStart0 < changeStart1
        ? changeStart0
        : changeStart1;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/)