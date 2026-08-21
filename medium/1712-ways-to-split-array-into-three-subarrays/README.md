# Ways to Split Array Into Three Subarrays

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A split of an integer array is good if:


	The array is split into three non-empty contiguous subarrays - named left, mid, right respectively from left to right.
	The sum of the elements in left is less than or equal to the sum of the elements in mid, and the sum of the elements in mid is less than or equal to the sum of the elements in right.


Given nums, an array of non-negative integers, return the number of good ways to split nums. As the number may be too large, return it modulo 109 + 7.

 
Example 1:

Input: nums = [1,1,1]
Output: 1
Explanation: The only good way to split nums is [1] [1] [1].

Example 2:

Input: nums = [1,2,2,2,5,0]
Output: 3
Explanation: There are three good ways of splitting nums:
[1] [2] [2,2,5,0]
[1] [2,2] [2,5,0]
[1,2] [2,2] [5,0]


Example 3:

Input: nums = [3,2,1]
Output: 0
Explanation: There is no good way to split nums.

 
Constraints:


	3 <= nums.length <= 105
	0 <= nums[i] <= 104

## Solution

**Language:** dart  
**Runtime:** 65 ms (beats 100.00%)  
**Memory:** 184.7 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:32:36.640Z  

```dart
class Solution {
  int waysToSplit(List<int> nums) {
    const int MOD = 1000000007;
    int n = nums.length;

    List<int> prefix = List.filled(n, 0);
    prefix[0] = nums[0];

    for (int i = 1; i < n; i++) {
      prefix[i] = prefix[i - 1] + nums[i];
    }

    int ans = 0;

    for (int i = 0; i < n - 2; i++) {
      int left = prefix[i];

      // First j where middle sum >= left
      int low = i + 1;
      int high = n - 2;

      while (low <= high) {
        int mid = (low + high) ~/ 2;
        int middle = prefix[mid] - prefix[i];

        if (middle >= left) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      }

      int start = low;

      // Last j where middle sum <= right sum
      low = i + 1;
      high = n - 2;

      while (low <= high) {
        int mid = (low + high) ~/ 2;

        int middle = prefix[mid] - prefix[i];
        int right = prefix[n - 1] - prefix[mid];

        if (middle <= right) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }

      int end = high;

      if (start <= end) {
        ans = (ans + (end - start + 1)) % MOD;
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/ways-to-split-array-into-three-subarrays/)