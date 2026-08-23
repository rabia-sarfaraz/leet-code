# Make the XOR of All Segments Equal to Zero

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array nums​​​ and an integer k​​​​​. The XOR of a segment [left, right] where left <= right is the XOR of all the elements with indices between left and right, inclusive: nums[left] XOR nums[left+1] XOR ... XOR nums[right].

Return the minimum number of elements to change in the array such that the XOR of all segments of size k​​​​​​ is equal to zero.

 
Example 1:

Input: nums = [1,2,0,3,0], k = 1
Output: 3
Explanation: Modify the array from [1,2,0,3,0] to from [0,0,0,0,0].


Example 2:

Input: nums = [3,4,5,2,1,7,3,4,7], k = 3
Output: 3
Explanation: Modify the array from [3,4,5,2,1,7,3,4,7] to [3,4,7,3,4,7,3,4,7].


Example 3:

Input: nums = [1,2,4,1,2,5,1,2,6], k = 3
Output: 3
Explanation: Modify the array from [1,2,4,1,2,5,1,2,6] to [1,2,3,1,2,3,1,2,3].

 
Constraints:


	1 <= k <= nums.length <= 2000
	​​​​​​0 <= nums[i] < 210

## Solution

**Language:** dart  
**Runtime:** 118 ms (beats 100.00%)  
**Memory:** 152.2 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:34:25.430Z  

```dart
class Solution {
  int minChanges(List<int> nums, int k) {
    const int MAXX = 1024;
    const int INF = 1000000000;

    int n = nums.length;

    List<int> dp = List.filled(MAXX, INF);
    dp[0] = 0;

    for (int i = 0; i < k; i++) {
      Map<int, int> freq = {};
      int size = 0;

      // Elements at positions i, i+k, i+2k...
      for (int j = i; j < n; j += k) {
        freq[nums[j]] = (freq[nums[j]] ?? 0) + 1;
        size++;
      }

      List<int> ndp = List.filled(MAXX, INF);

      // Change every element in this group
      int minDp = dp.reduce((a, b) => a < b ? a : b);

      // Try changing the whole group to arbitrary values
      for (int x = 0; x < MAXX; x++) {
        ndp[x] = minDp + size;
      }

      // Keep an existing value
      for (var entry in freq.entries) {
        int value = entry.key;
        int count = entry.value;

        for (int prevXor = 0; prevXor < MAXX; prevXor++) {
          if (dp[prevXor] == INF) continue;

          int newXor = prevXor ^ value;

          int cost = dp[prevXor] + size - count;

          if (cost < ndp[newXor]) {
            ndp[newXor] = cost;
          }
        }
      }

      dp = ndp;
    }

    return dp[0];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/make-the-xor-of-all-segments-equal-to-zero/)