# Minimum Operations to Reduce X to Zero

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array `nums` and an integer `x`. In one operation, you can either remove the leftmost or the rightmost element from the array `nums` and subtract its value from `x`. Note that this **modifies** the array for future operations.

Return *the **minimum number** of operations to reduce *`x` *to **exactly*** `0` *if it is possible**, otherwise, return *`-1`.

 

**Example 1:**

```
Input: nums = [1,1,4,2,3], x = 5
Output: 2
Explanation: The optimal solution is to remove the last two elements to reduce x to zero.

```

**Example 2:**

```
Input: nums = [5,6,7,8,9], x = 4
Output: -1

```

**Example 3:**

```
Input: nums = [3,2,20,1,1,3], x = 10
Output: 5
Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

```

 

**Constraints:**

- 1 <= nums.length <= 105
- 1 <= nums[i] <= 104
- 1 <= x <= 109

## Solution

**Language:** dart  
**Runtime:** 4 ms (beats 100.00%)  
**Memory:** 189.4 MB (beats 100.00%)  
**Submitted:** 2026-09-23T03:44:19.978Z  

```dart
class Solution {
  int minOperations(List<int> nums, int x) {
    int total = 0;
    for (int num in nums) {
      total += num;
    }

    int target = total - x;

    if (target < 0) return -1;

    if (target == 0) return nums.length;

    int left = 0;
    int sum = 0;
    int maxLength = -1;

    for (int right = 0; right < nums.length; right++) {
      sum += nums[right];

      while (sum > target && left <= right) {
        sum -= nums[left];
        left++;
      }

      if (sum == target) {
        maxLength = maxLength < right - left + 1
            ? right - left + 1
            : maxLength;
      }
    }

    if (maxLength == -1) return -1;

    return nums.length - maxLength;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/)