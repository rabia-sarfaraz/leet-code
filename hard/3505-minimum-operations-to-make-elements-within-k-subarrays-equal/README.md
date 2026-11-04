# Minimum Operations to Make Elements Within K Subarrays Equal

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an integer array `nums` and two integers, `x` and `k`. You can perform the following operation any number of times (**including zero**):

- Increase or decrease any element of nums by 1.

Return the **minimum** number of operations needed to have **at least** `k` *non-overlapping subarrays* of size **exactly** `x` in `nums`, where all elements within each subarray are equal.

 

**Example 1:**

**Input:** nums = [5,-2,1,3,7,3,6,4,-1], x = 3, k = 2

**Output:** 8

**Explanation:**

- Use 3 operations to add 3 to nums[1] and use 2 operations to subtract 2 from nums[3]. The resulting array is [5, 1, 1, 1, 7, 3, 6, 4, -1].
- Use 1 operation to add 1 to nums[5] and use 2 operations to subtract 2 from nums[6]. The resulting array is [5, 1, 1, 1, 7, 4, 4, 4, -1].
- Now, all elements within each subarray [1, 1, 1] (from indices 1 to 3) and [4, 4, 4] (from indices 5 to 7) are equal. Since 8 total operations were used, 8 is the output.

**Example 2:**

**Input:** nums = [9,-2,-2,-2,1,5], x = 2, k = 2

**Output:** 3

**Explanation:**

- Use 3 operations to subtract 3 from nums[4]. The resulting array is [9, -2, -2, -2, -2, 5].
- Now, all elements within each subarray [-2, -2] (from indices 1 to 2) and [-2, -2] (from indices 3 to 4) are equal. Since 3 operations were used, 3 is the output.

 

**Constraints:**

- 2 <= nums.length <= 105
- -106 <= nums[i] <= 106
- 2 <= x <= nums.length
- 1 <= k <= 15
- 2 <= k * x <= nums.length

## Solution

**Language:** dart  
**Runtime:** 1111 ms (beats 100.00%)  
**Memory:** 358.1 MB (beats 100.00%)  
**Submitted:** 2026-11-04T05:04:11.314Z  

```dart

class FenwickTree {
  final int n;
  late List<int> tree;

  FenwickTree(this.n) {
    tree = List.filled(n + 1, 0);
  }

  void add(int index, int value) {
    while (index <= n) {
      tree[index] += value;
      index += index & -index;
    }
  }

  int query(int index) {
    int result = 0;

    while (index > 0) {
      result += tree[index];
      index -= index & -index;
    }

    return result;
  }

  int kth(int k) {
    int index = 0;
    int step = 1;

    while ((step << 1) <= n) {
      step <<= 1;
    }

    while (step > 0) {
      int next = index + step;

      if (next <= n && tree[next] < k) {
        index = next;
        k -= tree[next];
      }

      step >>= 1;
    }

    return index + 1;
  }
}

class Solution {
  int minOperations(List<int> nums, int x, int k) {
    int n = nums.length;

    // Coordinate compression
    List<int> values = nums.toSet().toList()..sort();

    int size = values.length;

    Map<int, int> ranks = {};

    for (int i = 0; i < size; i++) {
      ranks[values[i]] = i + 1;
    }

    FenwickTree countTree = FenwickTree(size);
    FenwickTree sumTree = FenwickTree(size);

    // Add and remove elements
    void update(int num, int delta) {
      int index = ranks[num]!;

      countTree.add(index, delta);
      sumTree.add(index, num * delta);
    }

    // Calculate minimum operations for current window
    int getCost(int windowSum) {
      int medianIndex = countTree.kth((x + 1) ~/ 2);

      int median = values[medianIndex - 1];

      int leftCount = countTree.query(medianIndex);
      int leftSum = sumTree.query(medianIndex);

      int rightCount = x - leftCount;
      int rightSum = windowSum - leftSum;

      return median * leftCount -
          leftSum +
          rightSum -
          median * rightCount;
    }

    // Calculate cost of every window of size x
    List<int> costs = [];

    int windowSum = 0;

    for (int i = 0; i < x; i++) {
      update(nums[i], 1);
      windowSum += nums[i];
    }

    costs.add(getCost(windowSum));

    for (int i = x; i < n; i++) {
      update(nums[i - x], -1);
      windowSum -= nums[i - x];

      update(nums[i], 1);
      windowSum += nums[i];

      costs.add(getCost(windowSum));
    }

    // Dynamic Programming
    const int inf = 1 << 60;

    List<List<int>> dp = List.generate(
      k + 1,
      (_) => List.filled(n + 1, inf),
    );

    // Zero selected subarrays requires zero operations
    for (int i = 0; i <= n; i++) {
      dp[0][i] = 0;
    }

    for (int t = 1; t <= k; t++) {
      for (int i = 1; i <= n; i++) {
        // Skip current position
        dp[t][i] = dp[t][i - 1];

        // Select a window ending at i - 1
        if (i >= x) {
          int previous = dp[t - 1][i - x];

          if (previous != inf) {
            int candidate = previous + costs[i - x];

            if (candidate < dp[t][i]) {
              dp[t][i] = candidate;
            }
          }
        }
      }
    }

    return dp[k][n];
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-make-elements-within-k-subarrays-equal/)