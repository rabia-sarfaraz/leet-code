# Partitioning Into Minimum Number Of Deci-Binary Numbers

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A decimal number is called deci-binary if each of its digits is either 0 or 1 without any leading zeros. For example, 101 and 1100 are deci-binary, while 112 and 3001 are not.

Given a string n that represents a positive decimal integer, return the minimum number of positive deci-binary numbers needed so that they sum up to n.

 
Example 1:

Input: n = "32"
Output: 3
Explanation: 10 + 11 + 11 = 32


Example 2:

Input: n = "82734"
Output: 8


Example 3:

Input: n = "27346209830709182346"
Output: 9


 
Constraints:


	1 <= n.length <= 105
	n consists of only digits.
	n does not contain any leading zeros and represents a positive integer.

## Solution

**Language:** dart  
**Runtime:** 52 ms (beats 50.00%)  
**Memory:** 159 MB  
**Submitted:** 2026-08-21T04:18:54.854Z  

```dart
class Solution {
  int minPartitions(String n) {
    int maxDigit = 0;

    for (String digit in n.split('')) {
      int value = int.parse(digit);

      if (value > maxDigit) {
        maxDigit = value;
      }
    }

    return maxDigit;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/partitioning-into-minimum-number-of-deci-binary-numbers/)