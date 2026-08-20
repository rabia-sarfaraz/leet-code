# Minimum Incompatibility

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an integer array nums​​​ and an integer k. You are asked to distribute this array into k subsets of equal size such that there are no two equal elements in the same subset.

A subset's incompatibility is the difference between the maximum and minimum elements in that array.

Return the minimum possible sum of incompatibilities of the k subsets after distributing the array optimally, or return -1 if it is not possible.

A subset is a group integers that appear in the array with no particular order.

 
Example 1:

Input: nums = [1,2,1,4], k = 2
Output: 4
Explanation: The optimal distribution of subsets is [1,2] and [1,4].
The incompatibility is (2-1) + (4-1) = 4.
Note that [1,1] and [2,4] would result in a smaller sum, but the first subset contains 2 equal elements.

Example 2:

Input: nums = [6,3,8,1,3,1,2,2], k = 4
Output: 6
Explanation: The optimal distribution of subsets is [1,2], [2,3], [6,8], and [1,3].
The incompatibility is (2-1) + (3-2) + (8-6) + (3-1) = 6.


Example 3:

Input: nums = [5,3,3,6,3,3], k = 3
Output: -1
Explanation: It is impossible to distribute nums into 3 subsets where no two elements are equal in the same subset.


 
Constraints:


	1 <= k <= nums.length <= 16
	nums.length is divisible by k
	1 <= nums[i] <= nums.length

## Solution

**Language:** dart  
**Runtime:** 863 ms (beats 100.00%)  
**Memory:** 156.5 MB (beats 100.00%)  
**Submitted:** 2026-08-20T04:37:28.618Z  

```dart
class Solution {
  int minimumIncompatibility(List<int> nums, int k) {
    int n = nums.length;
    int groupSize = n ~/ k;

    nums.sort();

    // If any number occurs more than k times,
    // it is impossible to distribute them.
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;

      if (freq[num]! > k) {
        return -1;
      }
    }

    int totalMasks = 1 << n;
    const int INF = 1000000000;

    List<int> groupCost = List.filled(totalMasks, -1);

    // Calculate incompatibility of every possible group
    for (int mask = 0; mask < totalMasks; mask++) {
      if (_bitCount(mask) != groupSize) {
        continue;
      }

      int first = -1;
      int last = -1;
      bool valid = true;
      Set<int> seen = {};

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) {
          if (seen.contains(nums[i])) {
            valid = false;
            break;
          }

          seen.add(nums[i]);

          if (first == -1) {
            first = nums[i];
          }

          last = nums[i];
        }
      }

      if (valid) {
        groupCost[mask] = last - first;
      }
    }

    List<int> dp = List.filled(totalMasks, INF);
    dp[0] = 0;

    for (int mask = 0; mask < totalMasks; mask++) {
      if (dp[mask] == INF) {
        continue;
      }

      int used = _bitCount(mask);

      if (used == n) {
        continue;
      }

      // First unused element
      int firstUnused = -1;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) == 0) {
          firstUnused = i;
          break;
        }
      }

      // Try all groups containing first unused element
      for (int group = 0; group < totalMasks; group++) {
        if ((group & (1 << firstUnused)) == 0) {
          continue;
        }

        if ((group & mask) != 0) {
          continue;
        }

        if (groupCost[group] == -1) {
          continue;
        }

        int newMask = mask | group;

        dp[newMask] = min(
          dp[newMask],
          dp[mask] + groupCost[group],
        );
      }
    }

    return dp[totalMasks - 1];
  }

  int _bitCount(int x) {
    int count = 0;

    while (x != 0) {
      count += x & 1;
      x >>= 1;
    }

    return count;
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-incompatibility/)