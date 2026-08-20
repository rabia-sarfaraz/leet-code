# Max Number of K-Sum Pairs

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array nums and an integer k.

In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

Return the maximum number of operations you can perform on the array.

 
Example 1:

Input: nums = [1,2,3,4], k = 5
Output: 2
Explanation: Starting with nums = [1,2,3,4]:
- Remove numbers 1 and 4, then nums = [2,3]
- Remove numbers 2 and 3, then nums = []
There are no more pairs that sum up to 5, hence a total of 2 operations.

Example 2:

Input: nums = [3,1,3,4,3], k = 6
Output: 1
Explanation: Starting with nums = [3,1,3,4,3]:
- Remove the first two 3's, then nums = [1,4,3]
There are no more pairs that sum up to 6, hence a total of 1 operation.

 
Constraints:


	1 <= nums.length <= 105
	1 <= nums[i] <= 109
	1 <= k <= 109

## Solution

**Language:** Python  
**Runtime:** 551 ms (beats 60.01%)  
**Memory:** 22.1 MB (beats 54.14%)  
**Submitted:** 2026-08-20T04:35:07.926Z  

```py
class Solution(object):
    def maxOperations(self, nums, k):
        count = {}
        operations = 0

        for num in nums:
            complement = k - num

            if count.get(complement, 0) > 0:
                operations += 1
                count[complement] -= 1
            else:
                count[num] = count.get(num, 0) + 1

        return operations
```

---

[View on LeetCode](https://leetcode.com/problems/max-number-of-k-sum-pairs/)