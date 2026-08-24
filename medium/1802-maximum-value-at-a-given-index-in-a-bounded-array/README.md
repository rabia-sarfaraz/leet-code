# Maximum Value at a Given Index in a Bounded Array

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given three positive integers: n, index, and maxSum. You want to construct an array nums (0-indexed) that satisfies the following conditions:


	nums.length == n
	nums[i] is a positive integer where 0 <= i < n.
	abs(nums[i] - nums[i+1]) <= 1 where 0 <= i < n-1.
	The sum of all the elements of nums does not exceed maxSum.
	nums[index] is maximized.


Return nums[index] of the constructed array.

Note that abs(x) equals x if x >= 0, and -x otherwise.

 
Example 1:

Input: n = 4, index = 2,  maxSum = 6
Output: 2
Explanation: nums = [1,2,2,1] is one array that satisfies all the conditions.
There are no arrays that satisfy all the conditions and have nums[2] == 3, so 2 is the maximum nums[2].


Example 2:

Input: n = 6, index = 1,  maxSum = 10
Output: 3


 
Constraints:


	1 <= n <= maxSum <= 109
	0 <= index < n

## Solution

**Language:** Python  
**Runtime:** 1 ms (beats 79.17%)  
**Memory:** 12.5 MB  
**Submitted:** 2026-08-24T03:24:34.664Z  

```py
class Solution(object):
    def maxValue(self, n, index, maxSum):
        """
        :type n: int
        :type index: int
        :type maxSum: int
        :rtype: int
        """

        def side_sum(peak, length):
            # peak, peak-1, ..., 1
            if peak > length:
                low = peak - length + 1
                return (peak + low) * length // 2
            else:
                # peak, peak-1, ..., 2, 1, 1, 1...
                return peak * (peak + 1) // 2 + (length - peak)

        left = 1
        right = maxSum

        while left <= right:
            mid = (left + right) // 2

            left_sum = side_sum(mid - 1, index)
            right_sum = side_sum(mid - 1, n - index - 1)

            total = left_sum + mid + right_sum

            if total <= maxSum:
                left = mid + 1
            else:
                right = mid - 1

        return right
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/)