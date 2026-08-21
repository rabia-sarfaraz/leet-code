# Minimum Operations to Make a Subsequence

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array target that consists of distinct integers and another integer array arr that can have duplicates.

In one operation, you can insert any integer at any position in arr. For example, if arr = [1,4,1,2], you can add 3 in the middle and make it [1,4,3,1,2]. Note that you can insert the integer at the very beginning or end of the array.

Return the minimum number of operations needed to make target a subsequence of arr.

A subsequence of an array is a new array generated from the original array by deleting some elements (possibly none) without changing the remaining elements' relative order. For example, [2,7,4] is a subsequence of [4,2,3,7,2,1,4] (the underlined elements), while [2,4,2] is not.

 
Example 1:

Input: target = [5,1,3], arr = [9,4,2,3,4]
Output: 2
Explanation: You can add 5 and 1 in such a way that makes arr = [5,9,4,1,2,3,4], then target will be a subsequence of arr.


Example 2:

Input: target = [6,4,8,1,3,2], arr = [4,7,6,2,3,8,6,1]
Output: 3


 
Constraints:


	1 <= target.length, arr.length <= 105
	1 <= target[i], arr[i] <= 109
	target contains no duplicates.

## Solution

**Language:** dart  
**Runtime:** 63 ms (beats 100.00%)  
**Memory:** 201.8 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:34:35.772Z  

```dart
class Solution {
  int minOperations(List<int> target, List<int> arr) {
    Map<int, int> pos = {};

    // Target ke har element ki position
    for (int i = 0; i < target.length; i++) {
      pos[target[i]] = i;
    }

    // Arr ko target ki positions mein convert karo
    List<int> sequence = [];

    for (int x in arr) {
      if (pos.containsKey(x)) {
        sequence.add(pos[x]!);
      }
    }

    // LIS find karo
    List<int> lis = [];

    for (int x in sequence) {
      int left = 0;
      int right = lis.length;

      while (left < right) {
        int mid = (left + right) ~/ 2;

        if (lis[mid] < x) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      if (left == lis.length) {
        lis.add(x);
      } else {
        lis[left] = x;
      }
    }

    return target.length - lis.length;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-make-a-subsequence/)