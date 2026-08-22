# Sum of Unique Elements

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array.

Return the sum of all the unique elements of nums.

 
Example 1:

Input: nums = [1,2,3,2]
Output: 4
Explanation: The unique elements are [1,3], and the sum is 4.


Example 2:

Input: nums = [1,1,1,1,1]
Output: 0
Explanation: There are no unique elements, and the sum is 0.


Example 3:

Input: nums = [1,2,3,4,5]
Output: 15
Explanation: The unique elements are [1,2,3,4,5], and the sum is 15.


 
Constraints:


	1 <= nums.length <= 100
	1 <= nums[i] <= 100

## Solution

**Language:** dart  
**Runtime:** 10 ms (beats 100.00%)  
**Memory:** 150.1 MB  
**Submitted:** 2026-08-22T03:54:41.804Z  

```dart
class Solution {
  int sumOfUnique(List<int> nums) {
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    int sum = 0;

    for (int num in freq.keys) {
      if (freq[num] == 1) {
        sum += num;
      }
    }

    return sum;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/sum-of-unique-elements/)