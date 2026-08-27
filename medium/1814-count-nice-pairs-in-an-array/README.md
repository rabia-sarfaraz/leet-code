# Count Nice Pairs in an Array

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an array nums that consists of non-negative integers. Let us define rev(x) as the reverse of the non-negative integer x. For example, rev(123) = 321, and rev(120) = 21. A pair of indices (i, j) is nice if it satisfies all of the following conditions:


	0 <= i < j < nums.length
	nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])


Return the number of nice pairs of indices. Since that number can be too large, return it modulo 109 + 7.

 
Example 1:

Input: nums = [42,11,1,97]
Output: 2
Explanation: The two pairs are:
 - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
 - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.


Example 2:

Input: nums = [13,10,35,24,76]
Output: 4


 
Constraints:


	1 <= nums.length <= 105
	0 <= nums[i] <= 109

## Solution

**Language:** Python  
**Runtime:** 277 ms (beats 33.93%)  
**Memory:** 20.8 MB (beats 55.36%)  
**Submitted:** 2026-08-27T10:54:07.463Z  

```py
class Solution(object):
    def countNicePairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        MOD = 10**9 + 7

        freq = {}
        ans = 0

        def rev(x):
            return int(str(x)[::-1])

        for num in nums:
            key = num - rev(num)

            if key in freq:
                ans = (ans + freq[key]) % MOD

            freq[key] = freq.get(key, 0) + 1

        return ans
```

---

[View on LeetCode](https://leetcode.com/problems/count-nice-pairs-in-an-array/)