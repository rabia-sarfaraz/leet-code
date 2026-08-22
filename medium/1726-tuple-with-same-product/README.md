# Tuple with Same Product

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given an array nums of distinct positive integers, return the number of tuples (a, b, c, d) such that a * b = c * d where a, b, c, and d are elements of nums, and a != b != c != d.

 
Example 1:

Input: nums = [2,3,4,6]
Output: 8
Explanation: There are 8 valid tuples:
(2,6,3,4) , (2,6,4,3) , (6,2,3,4) , (6,2,4,3)
(3,4,2,6) , (4,3,2,6) , (3,4,6,2) , (4,3,6,2)


Example 2:

Input: nums = [1,2,4,5,10]
Output: 16
Explanation: There are 16 valid tuples:
(1,10,2,5) , (1,10,5,2) , (10,1,2,5) , (10,1,5,2)
(2,5,1,10) , (2,5,10,1) , (5,2,1,10) , (5,2,10,1)
(2,10,4,5) , (2,10,5,4) , (10,2,4,5) , (10,2,5,4)
(4,5,2,10) , (4,5,10,2) , (5,4,2,10) , (5,4,10,2)


 
Constraints:


	1 <= nums.length <= 1000
	1 <= nums[i] <= 104
	All elements in nums are distinct.

## Solution

**Language:** dart  
**Runtime:** 159 ms (beats 100.00%)  
**Memory:** 228.1 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:39:27.778Z  

```dart
class Solution {
  int tupleSameProduct(List<int> nums) {
    Map<int, int> freq = {};
    int ans = 0;

    for (int i = 0; i < nums.length; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        int product = nums[i] * nums[j];

        int count = freq[product] ?? 0;

        // Har 2 pairs same product dein to 8 tuples bante hain
        ans += count * 8;

        freq[product] = count + 1;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/tuple-with-same-product/)