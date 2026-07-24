# Number of Unique XOR Triplets II

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array nums.

A XOR triplet is defined as the XOR of three elements nums[i] XOR nums[j] XOR nums[k] where i <= j <= k.

Return the number of unique XOR triplet values from all possible triplets (i, j, k).

 
Example 1:


Input: nums = [1,3]

Output: 2

Explanation:

The possible XOR triplet values are:


	(0, 0, 0) → 1 XOR 1 XOR 1 = 1
	(0, 0, 1) → 1 XOR 1 XOR 3 = 3
	(0, 1, 1) → 1 XOR 3 XOR 3 = 1
	(1, 1, 1) → 3 XOR 3 XOR 3 = 3


The unique XOR values are {1, 3}. Thus, the output is 2.


Example 2:


Input: nums = [6,7,8,9]

Output: 4

Explanation:

The possible XOR triplet values are {6, 7, 8, 9}. Thus, the output is 4.


 
Constraints:


	1 <= nums.length <= 1500
	1 <= nums[i] <= 1500

## Solution

**Language:** dart  
**Runtime:** 792 ms (beats 100.00%)  
**Memory:** 153.8 MB (beats 100.00%)  
**Submitted:** 2026-07-24T03:50:48.338Z  

```dart
class Solution {
  int uniqueXorTriplets(List<int> nums) {
    const int MAX = 2048;

    List<bool> pair = List.filled(MAX, false);

    int n = nums.length;

    // All XORs of two elements (i <= j)
    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        pair[nums[i] ^ nums[j]] = true;
      }
    }

    List<bool> ans = List.filled(MAX, false);

    // XOR with third element (k >= j not needed because values only matter)
    for (int x = 0; x < MAX; x++) {
      if (!pair[x]) continue;
      for (int v in nums) {
        ans[x ^ v] = true;
      }
    }

    int res = 0;
    for (bool ok in ans) {
      if (ok) res++;
    }
    return res;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-unique-xor-triplets-ii/)