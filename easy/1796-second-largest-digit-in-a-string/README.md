# Second Largest Digit in a String

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given an alphanumeric string s, return the second largest numerical digit that appears in s, or -1 if it does not exist.

An alphanumeric string is a string consisting of lowercase English letters and digits.

 
Example 1:

Input: s = "dfa12321afd"
Output: 2
Explanation: The digits that appear in s are [1, 2, 3]. The second largest digit is 2.


Example 2:

Input: s = "abc1111"
Output: -1
Explanation: The digits that appear in s are [1]. There is no second largest digit. 


 
Constraints:


	1 <= s.length <= 500
	s consists of only lowercase English letters and digits.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 149.3 MB (beats 75.00%)  
**Submitted:** 2026-08-23T05:38:54.649Z  

```dart
class Solution {
  int secondHighest(String s) {
    int largest = -1;
    int second = -1;

    for (int i = 0; i < s.length; i++) {
      if (s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
        int digit = s.codeUnitAt(i) - 48;

        if (digit > largest) {
          second = largest;
          largest = digit;
        } else if (digit < largest && digit > second) {
          second = digit;
        }
      }
    }

    return second;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/second-largest-digit-in-a-string/)