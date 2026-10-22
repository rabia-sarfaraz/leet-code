# Minimum Operations to Sort a Permutation

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer array `nums` of length `n`, where `nums` is a permutation of the integers from 0 to `n - 1`.

You may perform **only** the following operations:

- Reverse the entire array.
- Rotate Left by One: Move the first element to the end of the array, and rest elements to left by one position.

Return an integer denoting the **minimum** number of operations required to sort the array in **increasing** order. If it is **not possible** to sort the array using only the given operations, return -1.

 

**Example 1:**

**Input:** nums = [0,2,1]

**Output:** 2

**Explanation:**

- Rotate Left by one: [2, 1, 0]
- Reverse the array: [0, 1, 2]

The array becomes sorted in 2 operations, which is minimal

**Example 2:**

**Input:** nums = [1,0,2]

**Output:** 2

**Explanation:**

- Reverse the array: [2, 0, 1]
- Rotate Left by one: [0, 1, 2]

The array becomes sorted in 2 operations, which is minimal.

**Example 3:**

**Input:** nums = [2,0,1,3]

**Output:** -1

**Explanation:**

It is impossible to reach `[2, 0, 1, 3]`. Thus, the answer is -1.

 

**Constraints:**

- 1 <= n == nums.length <= 105
- 0 <= nums[i] <= n - 1
- nums is a permutation of integers from 0 to n - 1.

## Solution

**Language:** dart  
**Runtime:** 6 ms (beats 100.00%)  
**Memory:** 201.5 MB (beats 100.00%)  
**Submitted:** 2026-10-22T05:16:33.760Z  

```dart
class Solution {
  int minOperations(List<int> nums) {
    int n = nums.length;
    int zero = nums.indexOf(0);

    bool check(int step) {
      for (int i = 1; i < n; i++) {
        int prev = (zero + (i - 1) * step + n) % n;
        int curr = (zero + i * step + n) % n;

        if (nums[prev] > nums[curr]) {
          return false;
        }
      }
      return true;
    }

    int ans = 1000000000;

    if (check(1)) {
      ans = [ans, zero].reduce((a, b) => a < b ? a : b);
      int cost = n - zero + 2;
      if (cost < ans) ans = cost;
    }

    if (check(-1)) {
      int cost1 = zero + 2;
      if (cost1 < ans) ans = cost1;

      int cost2 = n - zero;
      if (cost2 < ans) ans = cost2;
    }

    return ans == 1000000000 ? -1 : ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-sort-a-permutation/)