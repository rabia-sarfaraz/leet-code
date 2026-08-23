# Check if One String Swap Can Make Strings Equal

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given two strings s1 and s2 of equal length. A string swap is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.

Return true if it is possible to make both strings equal by performing at most one string swap on exactly one of the strings. Otherwise, return false.

 
Example 1:

Input: s1 = "bank", s2 = "kanb"
Output: true
Explanation: For example, swap the first character with the last character of s2 to make "bank".


Example 2:

Input: s1 = "attack", s2 = "defend"
Output: false
Explanation: It is impossible to make them equal with one string swap.


Example 3:

Input: s1 = "kelb", s2 = "kelb"
Output: true
Explanation: The two strings are already equal, so no string swap operation is required.


 
Constraints:


	1 <= s1.length, s2.length <= 100
	s1.length == s2.length
	s1 and s2 consist of only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 146.4 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:36:36.289Z  

```dart
class Solution {
  bool areAlmostEqual(String s1, String s2) {
    List<int> diff = [];

    for (int i = 0; i < s1.length; i++) {
      if (s1[i] != s2[i]) {
        diff.add(i);
      }
    }

    // Already equal
    if (diff.isEmpty) {
      return true;
    }

    // More than one swap needed
    if (diff.length != 2) {
      return false;
    }

    int a = diff[0];
    int b = diff[1];

    // Check if swapping makes them equal
    return s1[a] == s2[b] && s1[b] == s2[a];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal/)