# Maximize Score After N Operations

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given nums, an array of positive integers of size 2 * n. You must perform n operations on this array.

In the ith operation (1-indexed), you will:


	Choose two elements, x and y.
	Receive a score of i * gcd(x, y).
	Remove x and y from nums.


Return the maximum score you can receive after performing n operations.

The function gcd(x, y) is the greatest common divisor of x and y.

 
Example 1:

Input: nums = [1,2]
Output: 1
Explanation: The optimal choice of operations is:
(1 * gcd(1, 2)) = 1


Example 2:

Input: nums = [3,4,6,8]
Output: 11
Explanation: The optimal choice of operations is:
(1 * gcd(3, 6)) + (2 * gcd(4, 8)) = 3 + 8 = 11


Example 3:

Input: nums = [1,2,3,4,5,6]
Output: 14
Explanation: The optimal choice of operations is:
(1 * gcd(1, 5)) + (2 * gcd(2, 4)) + (3 * gcd(3, 6)) = 1 + 4 + 9 = 14


 
Constraints:


	1 <= n <= 7
	nums.length == 2 * n
	1 <= nums[i] <= 106

## Solution

**Language:** dart  
**Runtime:** 116 ms (beats 100.00%)  
**Memory:** 151.5 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:40:05.462Z  

```dart
class Solution {
  int maxScore(List<int> nums) {
    int n = nums.length;
    int size = 1 << n;

    List<int> dp = List.filled(size, 0);

    int gcd(int a, int b) {
      while (b != 0) {
        int temp = a % b;
        a = b;
        b = temp;
      }
      return a;
    }

    for (int mask = 0; mask < size; mask++) {
      int used = 0;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) {
          used++;
        }
      }

      // Each operation uses 2 numbers
      if (used % 2 != 0) continue;

      int operation = used ~/ 2 + 1;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) continue;

        for (int j = i + 1; j < n; j++) {
          if ((mask & (1 << j)) != 0) continue;

          int newMask = mask | (1 << i) | (1 << j);

          int score =
              dp[mask] + operation * gcd(nums[i], nums[j]);

          if (score > dp[newMask]) {
            dp[newMask] = score;
          }
        }
      }
    }

    return dp[size - 1];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximize-score-after-n-operations/)