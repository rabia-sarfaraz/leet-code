# Construct Uniform Parity Array I

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given an array nums1 of n distinct integers.

You want to construct another array nums2 of length n such that the elements in nums2 are either all odd or all even.

For each index i, you must choose exactly one of the following (in any order):


	nums2[i] = nums1[i]
	nums2[i] = nums1[i] - nums1[j], for an index j != i


Return true if it is possible to construct such an array, otherwise, return false.

 
Example 1:


Input: nums1 = [2,3]

Output: true

Explanation:


	Choose nums2[0] = nums1[0] - nums1[1] = 2 - 3 = -1.
	Choose nums2[1] = nums1[1] = 3.
	nums2 = [-1, 3], and both elements are odd. Thus, the answer is true​​​​​​​.



Example 2:


Input: nums1 = [4,6]

Output: true

Explanation:​​​​​​​


	Choose nums2[0] = nums1[0] = 4.
	Choose nums2[1] = nums1[1] = 6.
	nums2 = [4, 6], and all elements are even. Thus, the answer is true.



 
Constraints:


	1 <= n == nums1.length <= 100
	1 <= nums1[i] <= 100
	nums1 consists of distinct integers.

## Solution

**Language:** dart  
**Runtime:** 1 ms  
**Memory:** 148.6 MB (beats 100.00%)  
**Submitted:** 2026-09-02T04:46:54.441Z  

```dart
class Solution {
  bool uniformArray(List<int> nums1) {
    int minValue = nums1.reduce((a, b) => a < b ? a : b);

    for (int num in nums1) {
      // Agar koi number minimum se different hai
      // aur dono odd hain, to uniform banana possible nahi.
      if (num % 2 != minValue % 2) {
        return true;
      }
    }

    return true;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/construct-uniform-parity-array-i/)