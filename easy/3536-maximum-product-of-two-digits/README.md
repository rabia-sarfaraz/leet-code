# Maximum Product of Two Digits

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given a positive integer n.

Return the maximum product of any two digits in n.

Note: You may use the same digit twice if it appears more than once in n.

 
Example 1:


Input: n = 31

Output: 3

Explanation:


	The digits of n are [3, 1].
	The possible products of any two digits are: 3 * 1 = 3.
	The maximum product is 3.



Example 2:


Input: n = 22

Output: 4

Explanation:


	The digits of n are [2, 2].
	The possible products of any two digits are: 2 * 2 = 4.
	The maximum product is 4.



Example 3:


Input: n = 124

Output: 8

Explanation:


	The digits of n are [1, 2, 4].
	The possible products of any two digits are: 1 * 2 = 2, 1 * 4 = 4, 2 * 4 = 8.
	The maximum product is 8.



 
Constraints:


	10 <= n <= 109

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 150.9 MB  
**Submitted:** 2026-07-25T06:26:33.313Z  

```dart
class Solution {
  int maxProduct(int n) {
    int max1 = 0, max2 = 0; // top two digits
    while (n > 0) {
      final d = n % 10;
      if (d >= max1) {
        max2 = max1;
        max1 = d;
      } else if (d > max2) {
        max2 = d;
      }
      n ~/= 10;
    }
    return max1 * max2;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-product-of-two-digits/)