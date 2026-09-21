# Find X Value of Array I

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an array of **positive** integers `nums`, and a **positive** integer `k`.

You are allowed to perform an operation **once** on `nums`, where in each operation you can remove any **non-overlapping** prefix and suffix from `nums` such that `nums` remains **non-empty**.

You need to find the **x-value** of `nums`, which is the number of ways to perform this operation so that the **product** of the remaining elements leaves a *remainder* of `x` when divided by `k`.

Return an array `result` of size `k` where `result[x]` is the **x-value** of `nums` for `0 <= x <= k - 1`.

A **prefix** of an array is a subarray that starts from the beginning of the array and extends to any point within it.

A **suffix** of an array is a subarray that starts at any point within the array and extends to the end of the array.

**Note** that the prefix and suffix to be chosen for the operation can be **empty**.

 

**Example 1:**

**Input:** nums = [1,2,3,4,5], k = 3

**Output:** [9,2,4]

**Explanation:**

- For x = 0, the possible operations include all possible ways to remove non-overlapping prefix/suffix that do not remove nums[2] == 3.
- For x = 1, the possible operations are: Remove the empty prefix and the suffix [2, 3, 4, 5]. nums becomes [1]. Remove the prefix [1, 2, 3] and the suffix [5]. nums becomes [4].
- For x = 2, the possible operations are: Remove the empty prefix and the suffix [3, 4, 5]. nums becomes [1, 2]. Remove the prefix [1] and the suffix [3, 4, 5]. nums becomes [2]. Remove the prefix [1, 2, 3] and the empty suffix. nums becomes [4, 5]. Remove the prefix [1, 2, 3, 4] and the empty suffix. nums becomes [5].

**Example 2:**

**Input:** nums = [1,2,4,8,16,32], k = 4

**Output:** [18,1,2,0]

**Explanation:**

- For x = 0, the only operations that do not result in x = 0 are: Remove the empty prefix and the suffix [4, 8, 16, 32]. nums becomes [1, 2]. Remove the empty prefix and the suffix [2, 4, 8, 16, 32]. nums becomes [1]. Remove the prefix [1] and the suffix [4, 8, 16, 32]. nums becomes [2].
- For x = 1, the only possible operation is: Remove the empty prefix and the suffix [2, 4, 8, 16, 32]. nums becomes [1].
- For x = 2, the possible operations are: Remove the empty prefix and the suffix [4, 8, 16, 32]. nums becomes [1, 2]. Remove the prefix [1] and the suffix [4, 8, 16, 32]. nums becomes [2].
- For x = 3, there is no possible way to perform the operation.

**Example 3:**

**Input:** nums = [1,1,2,1,1], k = 2

**Output:** [9,6]

 

**Constraints:**

- 1 <= nums[i] <= 109
- 1 <= nums.length <= 105
- 1 <= k <= 5

## Solution

**Language:** dart  
**Runtime:** 15 ms (beats 100.00%)  
**Memory:** 186.9 MB (beats 100.00%)  
**Submitted:** 2026-09-21T06:53:22.448Z  

```dart
class Solution {
  List<int> resultArray(List<int> nums, int k) {
    List<int> ans = List.filled(k, 0);
    List<int> dp = List.filled(k, 0);

    for (int num in nums) {
      int value = num % k;

      List<int> newDp = List.filled(k, 0);

      // Sirf current element wala subarray
      newDp[value] = 1;

      // Previous subarrays ko current element ke sath extend karo
      for (int r = 0; r < k; r++) {
        int newR = (r * value) % k;
        newDp[newR] += dp[r];
      }

      // Current ending wale saare subarrays answer mein add
      for (int r = 0; r < k; r++) {
        ans[r] += newDp[r];
      }

      dp = newDp;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-x-value-of-array-i/)