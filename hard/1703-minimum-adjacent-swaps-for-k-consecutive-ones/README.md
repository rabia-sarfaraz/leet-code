# Minimum Adjacent Swaps for K Consecutive Ones

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an integer array, nums, and an integer k. nums comprises of only 0's and 1's. In one move, you can choose two adjacent indices and swap their values.

Return the minimum number of moves required so that nums has k consecutive 1's.

 
Example 1:

Input: nums = [1,0,0,1,0,1], k = 2
Output: 1
Explanation: In 1 move, nums could be [1,0,0,0,1,1] and have 2 consecutive 1's.


Example 2:

Input: nums = [1,0,0,0,0,0,1,1], k = 3
Output: 5
Explanation: In 5 moves, the leftmost 1 can be shifted right until nums = [0,0,0,0,0,1,1,1].


Example 3:

Input: nums = [1,1,0,1], k = 2
Output: 0
Explanation: nums already has 2 consecutive 1's.


 
Constraints:


	1 <= nums.length <= 105
	nums[i] is 0 or 1.
	1 <= k <= sum(nums)

## Solution

**Language:** dart  
**Runtime:** 45 ms (beats 100.00%)  
**Memory:** 214.8 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:11:18.489Z  

```dart
class Solution {
  int minMoves(List<int> nums, int k) {
    List<int> pos = [];

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 1) {
        pos.add(i);
      }
    }

    if (k == 1) return 0;

    // Adjust positions so that consecutive ones can be centered
    List<int> adjusted = [];

    for (int i = 0; i < pos.length; i++) {
      adjusted.add(pos[i] - i);
    }

    // Prefix sum
    List<int> prefix = List.filled(adjusted.length + 1, 0);

    for (int i = 0; i < adjusted.length; i++) {
      prefix[i + 1] = prefix[i] + adjusted[i];
    }

    int ans = 1 << 60;

    for (int i = 0; i + k <= adjusted.length; i++) {
      int mid = i + k ~/ 2;
      int median = adjusted[mid];

      int leftCount = mid - i;
      int rightCount = i + k - mid - 1;

      int leftSum = prefix[mid] - prefix[i];
      int rightSum = prefix[i + k] - prefix[mid + 1];

      int cost =
          median * leftCount - leftSum +
          rightSum - median * rightCount;

      ans = ans < cost ? ans : cost;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-adjacent-swaps-for-k-consecutive-ones/)