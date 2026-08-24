# Count Pairs With XOR in a Range

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a (0-indexed) integer array nums and two integers low and high, return the number of nice pairs.

A nice pair is a pair (i, j) where 0 <= i < j < nums.length and low <= (nums[i] XOR nums[j]) <= high.

 
Example 1:

Input: nums = [1,4,2,7], low = 2, high = 6
Output: 6
Explanation: All nice pairs (i, j) are as follows:
    - (0, 1): nums[0] XOR nums[1] = 5 
    - (0, 2): nums[0] XOR nums[2] = 3
    - (0, 3): nums[0] XOR nums[3] = 6
    - (1, 2): nums[1] XOR nums[2] = 6
    - (1, 3): nums[1] XOR nums[3] = 3
    - (2, 3): nums[2] XOR nums[3] = 5


Example 2:

Input: nums = [9,8,4,2,1], low = 5, high = 14
Output: 8
Explanation: All nice pairs (i, j) are as follows:
​​​​​    - (0, 2): nums[0] XOR nums[2] = 13
    - (0, 3): nums[0] XOR nums[3] = 11
    - (0, 4): nums[0] XOR nums[4] = 8
    - (1, 2): nums[1] XOR nums[2] = 12
    - (1, 3): nums[1] XOR nums[3] = 10
    - (1, 4): nums[1] XOR nums[4] = 9
    - (2, 3): nums[2] XOR nums[3] = 6
    - (2, 4): nums[2] XOR nums[4] = 5

 
Constraints:


	1 <= nums.length <= 2 * 104
	1 <= nums[i] <= 2 * 104
	1 <= low <= high <= 2 * 104

## Solution

**Language:** Python  
**Runtime:** 4153 ms (beats 77.78%)  
**Memory:** 32.2 MB (beats 22.22%)  
**Submitted:** 2026-08-24T03:25:56.335Z  

```py
class Solution(object):
    def countPairs(self, nums, low, high):
        """
        :type nums: List[int]
        :type low: int
        :type high: int
        :rtype: int
        """

        def count_less(limit):
            if limit <= 0:
                return 0

            class Node:
                def __init__(self):
                    self.child = [None, None]
                    self.count = 0

            root = Node()
            answer = 0

            def insert(num):
                node = root

                for bit in range(14, -1, -1):
                    b = (num >> bit) & 1

                    if node.child[b] is None:
                        node.child[b] = Node()

                    node = node.child[b]
                    node.count += 1

            def query(num):
                node = root
                result = 0

                for bit in range(14, -1, -1):
                    if node is None:
                        break

                    a = (num >> bit) & 1
                    l = (limit >> bit) & 1

                    if l == 1:
                        # XOR bit = 0 => definitely smaller
                        if node.child[a] is not None:
                            result += node.child[a].count

                        # XOR bit = 1 => continue
                        node = node.child[1 - a]

                    else:
                        # XOR bit must be 0
                        node = node.child[a]

                return result

            for num in nums:
                answer += query(num)
                insert(num)

            return answer

        return count_less(high + 1) - count_less(low)
```

---

[View on LeetCode](https://leetcode.com/problems/count-pairs-with-xor-in-a-range/)