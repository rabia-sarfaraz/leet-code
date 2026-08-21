# Swapping Nodes in a Linked List

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given the head of a linked list, and an integer k.

Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).

 
Example 1:

Input: head = [1,2,3,4,5], k = 2
Output: [1,4,3,2,5]


Example 2:

Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
Output: [7,9,6,6,8,7,3,0,9,5]


 
Constraints:


	The number of nodes in the list is n.
	1 <= k <= n <= 105
	0 <= Node.val <= 100

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 218.1 MB  
**Submitted:** 2026-08-21T10:38:56.483Z  

```dart
class Solution {
  ListNode? swapNodes(ListNode? head, int k) {
    ListNode? first = head;
    ListNode? second = head;

    // First node ko k-th position par le jao
    for (int i = 1; i < k; i++) {
      first = first!.next;
    }

    // First node ke saath ek pointer end tak le jao
    ListNode? temp = first;

    while (temp!.next != null) {
      temp = temp.next;
      second = second!.next;
    }

    // Values swap karo
    int value = first!.val;
    first.val = second!.val;
    second.val = value;

    return head;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/swapping-nodes-in-a-linked-list/)