# Median of Two Sorted Arrays

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return **the median** of the two sorted arrays.

The overall run time complexity should be `O(log (m+n))`.

 

**Example 1:**

```
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.

```

**Example 2:**

```
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

```

 

**Constraints:**

- nums1.length == m
- nums2.length == n
- 0 <= m <= 1000
- 0 <= n <= 1000
- 1 <= m + n <= 2000
- -106 <= nums1[i], nums2[i] <= 106

## Solution

**Language:** dart  
**Runtime:** 29 ms (beats 16.67%)  
**Memory:** 156.3 MB (beats 22.55%)  
**Submitted:** 2026-09-30T04:37:30.966Z  

```dart
class Solution {
  double findMedianSortedArrays(
      List<int> nums1, List<int> nums2) {
    List<int> nums = [...nums1, ...nums2];

    nums.sort();

    int n = nums.length;

    if (n % 2 == 1) {
      return nums[n ~/ 2].toDouble();
    } else {
      return (nums[n ~/ 2 - 1] + nums[n ~/ 2]) / 2.0;
    }
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/median-of-two-sorted-arrays/)