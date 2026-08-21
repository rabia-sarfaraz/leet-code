# Jump Game VI

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a 0-indexed integer array nums and an integer k.

You are initially standing at index 0. In one move, you can jump at most k steps forward without going outside the boundaries of the array. That is, you can jump from index i to any index in the range [i + 1, min(n - 1, i + k)] inclusive.

You want to reach the last index of the array (index n - 1). Your score is the sum of all nums[j] for each index j you visited in the array.

Return the maximum score you can get.

 
Example 1:

Input: nums = [1,-1,-2,4,-7,3], k = 2
Output: 7
Explanation: You can choose your jumps forming the subsequence [1,-1,4,3] (underlined above). The sum is 7.


Example 2:

Input: nums = [10,-5,-2,4,0,3], k = 3
Output: 17
Explanation: You can choose your jumps forming the subsequence [10,4,3] (underlined above). The sum is 17.


Example 3:

Input: nums = [1,-5,-20,4,-1,3,-6,-3], k = 2
Output: 0


 
Constraints:


	1 <= nums.length, k <= 105
	-104 <= nums[i] <= 104

## Solution

**Language:** dart  
**Runtime:** 17 ms (beats 100.00%)  
**Memory:** 180.2 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:07:39.128Z  

```dart
class Solution {
  int maxResult(List<int> nums, int k) {
    int n = nums.length;
    List<int> deque = [0];

    for (int i = 1; i < n; i++) {
      // Front se indices remove karo jo window se bahar hain
      while (deque.isNotEmpty && deque.first < i - k) {
        deque.removeAt(0);
      }

      // Current value + best previous score
      nums[i] += nums[deque.first];

      // Back se smaller scores remove karo
      while (deque.isNotEmpty &&
          nums[deque.last] <= nums[i]) {
        deque.removeLast();
      }

      deque.add(i);
    }

    return nums[n - 1];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/jump-game-vi/)