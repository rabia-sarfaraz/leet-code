# Find the Largest Almost Missing Integer

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given an integer array nums and an integer k.

An integer x is almost missing from nums if x appears in exactly one subarray of size k within nums.

Return the largest almost missing integer from nums. If no such integer exists, return -1.
A subarray is a contiguous sequence of elements within an array.
 
Example 1:


Input: nums = [3,9,2,1,7], k = 3

Output: 7

Explanation:


	1 appears in 2 subarrays of size 3: [9, 2, 1] and [2, 1, 7].
	2 appears in 3 subarrays of size 3: [3, 9, 2], [9, 2, 1], [2, 1, 7].
	3 appears in 1 subarray of size 3: [3, 9, 2].
	7 appears in 1 subarray of size 3: [2, 1, 7].
	9 appears in 2 subarrays of size 3: [3, 9, 2], and [9, 2, 1].


We return 7 since it is the largest integer that appears in exactly one subarray of size k.


Example 2:


Input: nums = [3,9,7,2,1,7], k = 4

Output: 3

Explanation:


	1 appears in 2 subarrays of size 4: [9, 7, 2, 1], [7, 2, 1, 7].
	2 appears in 3 subarrays of size 4: [3, 9, 7, 2], [9, 7, 2, 1], [7, 2, 1, 7].
	3 appears in 1 subarray of size 4: [3, 9, 7, 2].
	7 appears in 3 subarrays of size 4: [3, 9, 7, 2], [9, 7, 2, 1], [7, 2, 1, 7].
	9 appears in 2 subarrays of size 4: [3, 9, 7, 2], [9, 7, 2, 1].


We return 3 since it is the largest and only integer that appears in exactly one subarray of size k.


Example 3:


Input: nums = [0,0], k = 1

Output: -1

Explanation:

There is no integer that appears in only one subarray of size 1.


 
Constraints:


	1 <= nums.length <= 50
	0 <= nums[i] <= 50
	1 <= k <= nums.length

## Solution

**Language:** dart  
**Runtime:** 28 ms  
**Memory:** 153.6 MB (beats 100.00%)  
**Submitted:** 2026-08-18T04:33:48.405Z  

```dart
class Solution {
  int largestInteger(List<int> nums, int k) {
    Map<int, int> count = {};

    for (int i = 0; i <= nums.length - k; i++) {
      Set<int> seen = {};

      for (int j = i; j < i + k; j++) {
        seen.add(nums[j]);
      }

      for (int x in seen) {
        count[x] = (count[x] ?? 0) + 1;
      }
    }

    int ans = -1;

    for (int x in count.keys) {
      if (count[x] == 1) {
        ans = ans > x ? ans : x;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-the-largest-almost-missing-integer/)