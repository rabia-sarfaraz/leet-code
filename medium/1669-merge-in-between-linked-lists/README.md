# Merge In Between Linked Lists

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two linked lists: list1 and list2 of sizes n and m respectively.

Remove list1's nodes from the ath node to the bth node, and put list2 in their place.

The blue edges and nodes in the following figure indicate the result:

Build the result list and return its head.

 
Example 1:

Input: list1 = [10,1,13,6,9,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
Output: [10,1,13,1000000,1000001,1000002,5]
Explanation: We remove the nodes 3 and 4 and put the entire list2 in their place. The blue edges and nodes in the above figure indicate the result.


Example 2:

Input: list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
Output: [0,1,1000000,1000001,1000002,1000003,1000004,6]
Explanation: The blue edges and nodes in the above figure indicate the result.


 
Constraints:


	3 <= list1.length <= 104
	1 <= a <= b < list1.length - 1
	1 <= list2.length <= 104

## Solution

**Language:** Python  
**Runtime:** 363 ms (beats 41.10%)  
**Memory:** 23.6 MB (beats 36.20%)  
**Submitted:** 2026-08-07T05:00:28.475Z  

```py
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution(object):
    def mergeInBetween(self, list1, a, b, list2):
        """
        :type list1: ListNode
        :type a: int
        :type b: int
        :type list2: ListNode
        :rtype: ListNode
        """
        prev = list1
        for _ in range(a - 1):
            prev = prev.next

        curr = prev
        for _ in range(b - a + 2):
            curr = curr.next

        prev.next = list2

        tail = list2
        while tail.next:
            tail = tail.next

        tail.next = curr

        return list1
```

---

[View on LeetCode](https://leetcode.com/problems/merge-in-between-linked-lists/)