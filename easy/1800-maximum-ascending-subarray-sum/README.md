# Maximum Ascending Subarray Sum

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

Given an array of positive integers nums, return the maximum possible sum of an strictly increasing subarray in nums.

A subarray is defined as a contiguous sequence of numbers in an array.

 
Example 1:

Input: nums = [10,20,30,5,10,50]
Output: 65
Explanation: [5,10,50] is the ascending subarray with the maximum sum of 65.


Example 2:

Input: nums = [10,20,30,40,50]
Output: 150
Explanation: [10,20,30,40,50] is the ascending subarray with the maximum sum of 150.


Example 3:

Input: nums = [12,17,15,13,10,11,12]
Output: 33
Explanation: [10,11,12] is the ascending subarray with the maximum sum of 33.


 
Constraints:


	1 <= nums.length <= 100
	1 <= nums[i] <= 100

## Solution

**Language:** dart  
**Runtime:** 0 ms (beats 100.00%)  
**Memory:** 148.5 MB (beats 66.67%)  
**Submitted:** 2026-08-23T05:40:25.328Z  

```dart
class Solution {
  int maxAscendingSum(List<int> nums) {
    int current = nums[0];
    int answer = nums[0];

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        current += nums[i];
      } else {
        current = nums[i];
      }

      if (current > answer) {
        answer = current;
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-ascending-subarray-sum/)