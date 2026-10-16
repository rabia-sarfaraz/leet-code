# Subarrays Distinct Element Sum of Squares II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given a **0-indexed **integer array `nums`.

The **distinct count** of a subarray of `nums` is defined as:

- Let nums[i..j] be a subarray of nums consisting of all the indices from i to j such that 0 <= i <= j < nums.length. Then the number of distinct values in nums[i..j] is called the distinct count of nums[i..j].

Return *the sum of the **squares** of **distinct counts** of all subarrays of *`nums`.

Since the answer may be very large, return it **modulo** `109 + 7`.

A subarray is a contiguous **non-empty** sequence of elements within an array.

 

**Example 1:**

```
Input: nums = [1,2,1]
Output: 15
Explanation: Six possible subarrays are:
[1]: 1 distinct value
[2]: 1 distinct value
[1]: 1 distinct value
[1,2]: 2 distinct values
[2,1]: 2 distinct values
[1,2,1]: 2 distinct values
The sum of the squares of the distinct counts in all subarrays is equal to 12 + 12 + 12 + 22 + 22 + 22 = 15.

```

**Example 2:**

```
Input: nums = [2,2]
Output: 3
Explanation: Three possible subarrays are:
[2]: 1 distinct value
[2]: 1 distinct value
[2,2]: 1 distinct value
The sum of the squares of the distinct counts in all subarrays is equal to 12 + 12 + 12 = 3.
```

 

**Constraints:**

- 1 <= nums.length <= 105
- 1 <= nums[i] <= 105

## Solution

**Language:** dart  
**Runtime:** 959 ms (beats 100.00%)  
**Memory:** 289 MB (beats 100.00%)  
**Submitted:** 2026-10-16T05:17:19.151Z  

```dart

class Solution {
  static const int mod = 1000000007;

  late List<int> sumTree;
  late List<int> squareTree;
  late List<int> lazy;
  late int n;

  void apply(int node, int left, int right, int value) {
    int len = right - left + 1;
    int oldSum = sumTree[node];

    squareTree[node] = (
      squareTree[node] +
      (2 * value * oldSum) % mod +
      ((value * value) % mod) * len
    ) % mod;

    sumTree[node] = (oldSum + value * len) % mod;
    lazy[node] = (lazy[node] + value) % mod;
  }

  void pushDown(int node, int left, int right) {
    if (lazy[node] == 0 || left == right) return;

    int mid = (left + right) ~/ 2;
    int value = lazy[node];

    apply(node * 2, left, mid, value);
    apply(node * 2 + 1, mid + 1, right, value);

    lazy[node] = 0;
  }

  void update(
    int node,
    int start,
    int end,
    int ql,
    int qr,
    int value,
  ) {
    if (ql > end || qr < start) return;

    if (ql <= start && end <= qr) {
      apply(node, start, end, value);
      return;
    }

    pushDown(node, start, end);

    int mid = (start + end) ~/ 2;

    update(node * 2, start, mid, ql, qr, value);
    update(node * 2 + 1, mid + 1, end, ql, qr, value);

    sumTree[node] =
        (sumTree[node * 2] + sumTree[node * 2 + 1]) % mod;

    squareTree[node] =
        (squareTree[node * 2] + squareTree[node * 2 + 1]) % mod;
  }

  int sumCounts(List<int> nums) {
    n = nums.length;

    sumTree = List.filled(4 * n, 0);
    squareTree = List.filled(4 * n, 0);
    lazy = List.filled(4 * n, 0);

    List<int> last = List.filled(100001, -1);
    int answer = 0;

    for (int i = 0; i < n; i++) {
      int previous = last[nums[i]];

      update(
        1, 0, n - 1,
        previous + 1, i, 1,
      );

      answer = (answer + squareTree[1]) % mod;
      last[nums[i]] = i;
    }

    return answer;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/subarrays-distinct-element-sum-of-squares-ii/)