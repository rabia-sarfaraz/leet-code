# Minimum Absolute Sum Difference

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two positive integer arrays nums1 and nums2, both of length n.

The absolute sum difference of arrays nums1 and nums2 is defined as the sum of |nums1[i] - nums2[i]| for each 0 <= i < n (0-indexed).

You can replace at most one element of nums1 with any other element in nums1 to minimize the absolute sum difference.

Return the minimum absolute sum difference after replacing at most one element in the array nums1. Since the answer may be large, return it modulo 109 + 7.

|x| is defined as:


	x if x >= 0, or
	-x if x < 0.


 
Example 1:

Input: nums1 = [1,7,5], nums2 = [2,3,5]
Output: 3
Explanation: There are two possible optimal solutions:
- Replace the second element with the first: [1,7,5] => [1,1,5], or
- Replace the second element with the third: [1,7,5] => [1,5,5].
Both will yield an absolute sum difference of |1-2| + (|1-3| or |5-3|) + |5-5| = 3.


Example 2:

Input: nums1 = [2,4,6,8,10], nums2 = [2,4,6,8,10]
Output: 0
Explanation: nums1 is equal to nums2 so no replacement is needed. This will result in an 
absolute sum difference of 0.


Example 3:

Input: nums1 = [1,10,4,4,2,7], nums2 = [9,3,5,1,7,4]
Output: 20
Explanation: Replace the first element with the second: [1,10,4,4,2,7] => [10,10,4,4,2,7].
This yields an absolute sum difference of |10-9| + |10-3| + |4-5| + |4-1| + |2-7| + |7-4| = 20


 
Constraints:


	n == nums1.length
	n == nums2.length
	1 <= n <= 105
	1 <= nums1[i], nums2[i] <= 105

## Solution

**Language:** dart  
**Runtime:** 113 ms (beats 100.00%)  
**Memory:** 191.1 MB (beats 100.00%)  
**Submitted:** 2026-08-29T03:30:38.056Z  

```dart
class Solution {
  int minAbsoluteSumDiff(List<int> nums1, List<int> nums2) {
    const int MOD = 1000000007;
    int n = nums1.length;

    // nums1 ki sorted copy
    List<int> sorted = List.from(nums1)..sort();

    int total = 0;
    int maxSaving = 0;

    for (int i = 0; i < n; i++) {
      int diff = (nums1[i] - nums2[i]).abs();
      total = (total + diff) % MOD;

      // Binary search: nums2[i] ke closest value ko find karo
      int left = 0;
      int right = n - 1;

      while (left <= right) {
        int mid = (left + right) ~/ 2;

        if (sorted[mid] < nums2[i]) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }

      // left is the first value >= nums2[i]
      if (left < n) {
        int newDiff = (sorted[left] - nums2[i]).abs();
        maxSaving = maxSaving > (diff - newDiff)
            ? maxSaving
            : (diff - newDiff);
      }

      // Check previous value as well
      if (left > 0) {
        int newDiff = (sorted[left - 1] - nums2[i]).abs();
        maxSaving = maxSaving > (diff - newDiff)
            ? maxSaving
            : (diff - newDiff);
      }
    }

    return (total - maxSaving + MOD) % MOD;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-absolute-sum-difference/)