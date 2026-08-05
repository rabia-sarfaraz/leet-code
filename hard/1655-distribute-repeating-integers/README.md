# Distribute Repeating Integers

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array of n integers, nums, where there are at most 50 unique values in the array. You are also given an array of m customer order quantities, quantity, where quantity[i] is the amount of integers the ith customer ordered. Determine if it is possible to distribute nums such that:


	The ith customer gets exactly quantity[i] integers,
	The integers the ith customer gets are all equal, and
	Every customer is satisfied.


Return true if it is possible to distribute nums according to the above conditions.

 
Example 1:

Input: nums = [1,2,3,4], quantity = [2]
Output: false
Explanation: The 0th customer cannot be given two different integers.


Example 2:

Input: nums = [1,2,3,3], quantity = [2]
Output: true
Explanation: The 0th customer is given [3,3]. The integers [1,2] are not used.


Example 3:

Input: nums = [1,1,2,2], quantity = [2,2]
Output: true
Explanation: The 0th customer is given [1,1], and the 1st customer is given [2,2].


 
Constraints:


	n == nums.length
	1 <= n <= 105
	1 <= nums[i] <= 1000
	m == quantity.length
	1 <= m <= 10
	1 <= quantity[i] <= 105
	There are at most 50 unique values in nums.

## Solution

**Language:** Python  
**Runtime:** 1788 ms (beats 57.14%)  
**Memory:** 38 MB (beats 23.81%)  
**Submitted:** 2026-08-05T11:53:45.921Z  

```py
from collections import Counter

class Solution(object):
    def canDistribute(self, nums, quantity):
        """
        :type nums: List[int]
        :type quantity: List[int]
        :rtype: bool
        """
        freq = list(Counter(nums).values())
        quantity.sort(reverse=True)

        m = len(quantity)
        full = 1 << m

        subsetSum = [0] * full
        for mask in range(1, full):
            bit = mask & -mask
            idx = bit.bit_length() - 1
            subsetSum[mask] = subsetSum[mask ^ bit] + quantity[idx]

        memo = {}

        def dfs(i, mask):
            if mask == 0:
                return True
            if i == len(freq):
                return False

            if (i, mask) in memo:
                return memo[(i, mask)]

            sub = mask
            while sub:
                if subsetSum[sub] <= freq[i]:
                    if dfs(i + 1, mask ^ sub):
                        memo[(i, mask)] = True
                        return True
                sub = (sub - 1) & mask

            memo[(i, mask)] = dfs(i + 1, mask)
            return memo[(i, mask)]

        return dfs(0, full - 1)
```

---

[View on LeetCode](https://leetcode.com/problems/distribute-repeating-integers/)