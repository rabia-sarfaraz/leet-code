# Maximum Absolute Sum of Any Subarray

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array nums. The absolute sum of a subarray [numsl, numsl+1, ..., numsr-1, numsr] is abs(numsl + numsl+1 + ... + numsr-1 + numsr).

Return the maximum absolute sum of any (possibly empty) subarray of nums.

Note that abs(x) is defined as follows:


	If x is a negative integer, then abs(x) = -x.
	If x is a non-negative integer, then abs(x) = x.


 
Example 1:

Input: nums = [1,-3,2,3,-4]
Output: 5
Explanation: The subarray [2,3] has absolute sum = abs(2+3) = abs(5) = 5.


Example 2:

Input: nums = [2,-5,1,-4,3,-2]
Output: 8
Explanation: The subarray [-5,1,-4] has absolute sum = abs(-5+1-4) = abs(-8) = 8.


 
Constraints:


	1 <= nums.length <= 105
	-104 <= nums[i] <= 104

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 161.3 MB (beats 66.67%)  
**Submitted:** 2026-08-22T03:55:17.783Z  

```dart
class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int maxSum = 0;
    int minSum = 0;
    int currentMax = 0;
    int currentMin = 0;

    for (int num in nums) {
      currentMax = (currentMax + num > 0) ? currentMax + num : 0;
      currentMin = (currentMin + num < 0) ? currentMin + num : 0;

      maxSum = maxSum > currentMax ? maxSum : currentMax;
      minSum = minSum < currentMin ? minSum : currentMin;
    }

    return maxSum > -minSum ? maxSum : -minSum;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/)