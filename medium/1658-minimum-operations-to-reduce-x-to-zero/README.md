# Minimum Operations to Reduce X to Zero

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.

 
Example 1:

Input: nums = [1,1,4,2,3], x = 5
Output: 2
Explanation: The optimal solution is to remove the last two elements to reduce x to zero.


Example 2:

Input: nums = [5,6,7,8,9], x = 4
Output: -1


Example 3:

Input: nums = [3,2,20,1,1,3], x = 10
Output: 5
Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.


 
Constraints:


	1 <= nums.length <= 105
	1 <= nums[i] <= 104
	1 <= x <= 109

## Solution

**Language:** Python  
**Runtime:** 72 ms (beats 99.22%)  
**Memory:** 20.8 MB (beats 24.03%)  
**Submitted:** 2026-08-05T12:09:46.722Z  

```py
class Solution(object):
    def minOperations(self, nums, x):
        """
        :type nums: List[int]
        :type x: int
        :rtype: int
        """
        target = sum(nums) - x

        if target < 0:
            return -1
        if target == 0:
            return len(nums)

        left = 0
        curr = 0
        maxLen = -1

        for right in range(len(nums)):
            curr += nums[right]

            while curr > target:
                curr -= nums[left]
                left += 1

            if curr == target:
                maxLen = max(maxLen, right - left + 1)

        return -1 if maxLen == -1 else len(nums) - maxLen
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/)