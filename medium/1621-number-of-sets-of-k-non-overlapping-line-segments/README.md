# Number of Sets of K Non-Overlapping Line Segments

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given `n` points on a 1-D plane, where the `ith` point (from `0` to `n-1`) is at `x = i`, find the number of ways we can draw **exactly** `k` **non-overlapping** line segments such that each segment covers two or more points. The endpoints of each segment must have **integral coordinates**. The `k` line segments **do not** have to cover all `n` points, and they are **allowed** to share endpoints.

Return *the number of ways we can draw *`k`* non-overlapping line segments**.* Since this number can be huge, return it **modulo** `109 + 7`.

 

**Example 1:**

```
Input: n = 4, k = 2
Output: 5
Explanation: The two line segments are shown in red and blue.
The image above shows the 5 different ways {(0,2),(2,3)}, {(0,1),(1,3)}, {(0,1),(2,3)}, {(1,2),(2,3)}, {(0,1),(1,2)}.

```

**Example 2:**

```
Input: n = 3, k = 1
Output: 3
Explanation: The 3 ways are {(0,1)}, {(0,2)}, {(1,2)}.

```

**Example 3:**

```
Input: n = 30, k = 7
Output: 796297179
Explanation: The total number of possible ways to draw 7 line segments is 3796297200. Taking this number modulo 109 + 7 gives us 796297179.

```

 

**Constraints:**

- 2 <= n <= 1000
- 1 <= k <= n-1

## Solution

**Language:** dart  
**Runtime:** 47 ms (beats 100.00%)  
**Memory:** 149.2 MB (beats 100.00%)  
**Submitted:** 2026-09-16T05:33:09.110Z  

```dart
class Solution {
  int numberOfSets(int n, int k) {
    const int MOD = 1000000007;

    // f = currently no segment is being drawn
    // g = currently inside a segment
    List<int> f = List.filled(k + 1, 0);
    List<int> g = List.filled(k + 1, 0);

    // Before processing points:
    // 0 segments completed = 1 way
    f[0] = 1;

    for (int i = 2; i <= n; i++) {
      List<int> newF = List.filled(k + 1, 0);
      List<int> newG = List.filled(k + 1, 0);

      for (int j = 0; j <= k; j++) {
        // Don't draw a segment at this point
        newF[j] = (f[j] + g[j]) % MOD;

        // Continue an existing segment
        newG[j] = g[j];

        if (j > 0) {
          // Start a new segment
          newG[j] = (newG[j] + f[j - 1]) % MOD;

          // Finish current segment and start/continue appropriately
          newG[j] = (newG[j] + g[j - 1]) % MOD;
        }
      }

      f = newF;
      g = newG;
    }

    return (f[k] + g[k]) % MOD;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-sets-of-k-non-overlapping-line-segments/)