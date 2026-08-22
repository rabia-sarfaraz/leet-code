# Equal Sum Arrays With Minimum Number of Operations

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two arrays of integers nums1 and nums2, possibly of different lengths. The values in the arrays are between 1 and 6, inclusive.

In one operation, you can change any integer's value in any of the arrays to any value between 1 and 6, inclusive.

Return the minimum number of operations required to make the sum of values in nums1 equal to the sum of values in nums2. Return -1​​​​​ if it is not possible to make the sum of the two arrays equal.

 
Example 1:

Input: nums1 = [1,2,3,4,5,6], nums2 = [1,1,2,2,2,2]
Output: 3
Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed.
- Change nums2[0] to 6. nums1 = [1,2,3,4,5,6], nums2 = [6,1,2,2,2,2].
- Change nums1[5] to 1. nums1 = [1,2,3,4,5,1], nums2 = [6,1,2,2,2,2].
- Change nums1[2] to 2. nums1 = [1,2,2,4,5,1], nums2 = [6,1,2,2,2,2].


Example 2:

Input: nums1 = [1,1,1,1,1,1,1], nums2 = [6]
Output: -1
Explanation: There is no way to decrease the sum of nums1 or to increase the sum of nums2 to make them equal.


Example 3:

Input: nums1 = [6,6], nums2 = [1]
Output: 3
Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed. 
- Change nums1[0] to 2. nums1 = [2,6], nums2 = [1].
- Change nums1[1] to 2. nums1 = [2,2], nums2 = [1].
- Change nums2[0] to 4. nums1 = [2,2], nums2 = [4].


 
Constraints:


	1 <= nums1.length, nums2.length <= 105
	1 <= nums1[i], nums2[i] <= 6

## Solution

**Language:** dart  
**Runtime:** 59 ms (beats 100.00%)  
**Memory:** 205.4 MB (beats 100.00%)  
**Submitted:** 2026-08-22T04:10:44.246Z  

```dart
class Solution {
  int minOperations(List<int> nums1, List<int> nums2) {
    int sum1 = nums1.reduce((a, b) => a + b);
    int sum2 = nums2.reduce((a, b) => a + b);

    // Impossible case
    if (nums1.length * 6 < nums2.length ||
        nums2.length * 6 < nums1.length) {
      return -1;
    }

    if (sum1 == sum2) return 0;

    List<int> changes = [];

    if (sum1 > sum2) {
      // nums1 ko decrease OR nums2 ko increase
      for (int x in nums1) {
        changes.add(x - 1);
      }

      for (int x in nums2) {
        changes.add(6 - x);
      }
    } else {
      // nums1 ko increase OR nums2 ko decrease
      for (int x in nums1) {
        changes.add(6 - x);
      }

      for (int x in nums2) {
        changes.add(x - 1);
      }
    }

    changes.sort((a, b) => b.compareTo(a));

    int diff = (sum1 - sum2).abs();
    int operations = 0;

    for (int change in changes) {
      diff -= change;
      operations++;

      if (diff <= 0) {
        return operations;
      }
    }

    return -1;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/equal-sum-arrays-with-minimum-number-of-operations/)