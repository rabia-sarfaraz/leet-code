# Closest Subsequence Sum

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an integer array nums and an integer goal.

You want to choose a subsequence of nums such that the sum of its elements is the closest possible to goal. That is, if the sum of the subsequence's elements is sum, then you want to minimize the absolute difference abs(sum - goal).

Return the minimum possible value of abs(sum - goal).

Note that a subsequence of an array is an array formed by removing some elements (possibly all or none) of the original array.

 
Example 1:

Input: nums = [5,-7,3,5], goal = 6
Output: 0
Explanation: Choose the whole array as a subsequence, with a sum of 6.
This is equal to the goal, so the absolute difference is 0.


Example 2:

Input: nums = [7,-9,15,-2], goal = -5
Output: 1
Explanation: Choose the subsequence [7,-9,-2], with a sum of -4.
The absolute difference is abs(-4 - (-5)) = abs(1) = 1, which is the minimum.


Example 3:

Input: nums = [1,2,3], goal = -7
Output: 7


 
Constraints:


	1 <= nums.length <= 40
	-107 <= nums[i] <= 107
	-109 <= goal <= 109

## Solution

**Language:** dart  
**Runtime:** 1083 ms (beats 100.00%)  
**Memory:** 303.1 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:58:36.761Z  

```dart
class Solution {
  int minAbsDifference(List<int> nums, int goal) {
    int n = nums.length;
    int mid = n ~/ 2;

    List<int> left = [];
    List<int> right = [];

    void generate(List<int> arr, int index, int sum, List<int> result) {
      if (index == arr.length) {
        result.add(sum);
        return;
      }

      // Current element skip
      generate(arr, index + 1, sum, result);

      // Current element take
      generate(arr, index + 1, sum + arr[index], result);
    }

    generate(nums.sublist(0, mid), 0, 0, left);
    generate(nums.sublist(mid), 0, 0, right);

    right.sort();

    int answer = (goal - 0).abs();

    for (int x in left) {
      int target = goal - x;

      // Binary search
      int low = 0;
      int high = right.length - 1;

      while (low <= high) {
        int m = (low + high) ~/ 2;

        if (right[m] < target) {
          low = m + 1;
        } else {
          high = m - 1;
        }
      }

      // right[low] closest greater/equal value
      if (low < right.length) {
        int sum = x + right[low];
        answer = answer < (sum - goal).abs()
            ? answer
            : (sum - goal).abs();
      }

      // right[low - 1] closest smaller value
      if (low > 0) {
        int sum = x + right[low - 1];
        answer = answer < (sum - goal).abs()
            ? answer
            : (sum - goal).abs();
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/closest-subsequence-sum/)