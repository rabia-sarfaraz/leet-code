# Maximum Product of Three Numbers

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given an integer array nums, find three numbers whose product is maximum and return the maximum product.

 
Example 1:
Input: nums = [1,2,3]
Output: 6
Example 2:
Input: nums = [1,2,3,4]
Output: 24
Example 3:
Input: nums = [-1,-2,-3]
Output: -6

 
Constraints:


	3 <= nums.length <= 104
	-1000 <= nums[i] <= 1000

## Solution

**Language:** dart  
**Runtime:** 54 ms (beats 66.67%)  
**Memory:** 153.7 MB (beats 100.00%)  
**Submitted:** 2026-07-26T03:11:22.974Z  

```dart
class Solution {
  int maximumProduct(List<int> nums) {
    nums.sort();

    int n = nums.length;

    int a = nums[n - 1] * nums[n - 2] * nums[n - 3];
    int b = nums[0] * nums[1] * nums[n - 1];

    return a > b ? a : b;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-product-of-three-numbers/)