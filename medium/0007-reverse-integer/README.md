# Reverse Integer

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given a signed 32-bit integer `x`, return `x`* with its digits reversed*. If reversing `x` causes the value to go outside the signed 32-bit integer range `[-231, 231 - 1]`, then return `0`.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

 

**Example 1:**

```
Input: x = 123
Output: 321

```

**Example 2:**

```
Input: x = -123
Output: -321

```

**Example 3:**

```
Input: x = 120
Output: 21

```

 

**Constraints:**

- -231 <= x <= 231 - 1

## Solution

**Language:** dart  
**Runtime:** 370 ms (beats 63.38%)  
**Memory:** 148.3 MB (beats 78.87%)  
**Submitted:** 2026-09-30T04:40:59.765Z  

```dart
class Solution {
  int reverse(int x) {
    int sign = x < 0 ? -1 : 1;
    int num = x.abs();
    int result = 0;

    while (num > 0) {
      int digit = num % 10;
      result = result * 10 + digit;
      num ~/= 10;
    }

    result *= sign;

    // 32-bit signed integer range
    if (result < -2147483648 || result > 2147483647) {
      return 0;
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/reverse-integer/)