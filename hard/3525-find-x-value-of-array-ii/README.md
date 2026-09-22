# Find X Value of Array II

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array of **positive** integers `nums` and a **positive** integer `k`. You are also given a 2D array `queries`, where `queries[i] = [indexi, valuei, starti, xi]`.

You are allowed to perform an operation **once** on `nums`, where you can remove any **suffix** from `nums` such that `nums` remains **non-empty**.

The **x-value** of `nums` **for a given** `x` is defined as the number of ways to perform this operation so that the **product** of the remaining elements leaves a *remainder* of `x` **modulo** `k`.

For each query in `queries` you need to determine the **x-value** of `nums` for `xi` after performing the following actions:

- Update nums[indexi] to valuei. Only this step persists for the rest of the queries.
- Remove the prefix nums[0..(starti - 1)] (where nums[0..(-1)] will be used to represent the empty prefix).

Return an array `result` of size `queries.length` where `result[i]` is the answer for the `ith` query.

A **prefix** of an array is a subarray that starts from the beginning of the array and extends to any point within it.

A **suffix** of an array is a subarray that starts at any point within the array and extends to the end of the array.

**Note** that the prefix and suffix to be chosen for the operation can be **empty**.

**Note** that x-value has a *different* definition in this version.

 

**Example 1:**

**Input:** nums = [1,2,3,4,5], k = 3, queries = [[2,2,0,2],[3,3,3,0],[0,1,0,1]]

**Output:** [2,2,2]

**Explanation:**

- For query 0, nums becomes [1, 2, 2, 4, 5], and the empty prefix must be removed. The possible operations are: Remove the suffix [2, 4, 5]. nums becomes [1, 2]. Remove the empty suffix. nums becomes [1, 2, 2, 4, 5] with a product 80, which gives remainder 2 when divided by 3.
- For query 1, nums becomes [1, 2, 2, 3, 5], and the prefix [1, 2, 2] must be removed. The possible operations are: Remove the empty suffix. nums becomes [3, 5]. Remove the suffix [5]. nums becomes [3].
- For query 2, nums becomes [1, 2, 2, 3, 5], and the empty prefix must be removed. The possible operations are: Remove the suffix [2, 2, 3, 5]. nums becomes [1]. Remove the suffix [3, 5]. nums becomes [1, 2, 2].

**Example 2:**

**Input:** nums = [1,2,4,8,16,32], k = 4, queries = [[0,2,0,2],[0,2,0,1]]

**Output:** [1,0]

**Explanation:**

- For query 0, nums becomes [2, 2, 4, 8, 16, 32]. The only possible operation is: Remove the suffix [2, 4, 8, 16, 32].
- For query 1, nums becomes [2, 2, 4, 8, 16, 32]. There is no possible way to perform the operation.

**Example 3:**

**Input:** nums = [1,1,2,1,1], k = 2, queries = [[2,1,0,1]]

**Output:** [5]

 

**Constraints:**

- 1 <= nums[i] <= 109
- 1 <= nums.length <= 105
- 1 <= k <= 5
- 1 <= queries.length <= 2 * 104
- queries[i] == [indexi, valuei, starti, xi]
- 0 <= indexi <= nums.length - 1
- 1 <= valuei <= 109
- 0 <= starti <= nums.length - 1
- 0 <= xi <= k - 1

## Solution

**Language:** dart  
**Runtime:** 1035 ms (beats 100.00%)  
**Memory:** 357.4 MB (beats 100.00%)  
**Submitted:** 2026-09-22T04:17:23.850Z  

```dart
class Solution {
  late int k;
  late int n;
  late List<Node> tree;

  List<int> resultArray(
    List<int> nums,
    int k,
    List<List<int>> queries,
  ) {
    this.k = k;
    n = nums.length;

    tree = List.generate(4 * n, (_) => Node(k));

    _build(1, 0, n - 1, nums);

    List<int> ans = [];

    for (final q in queries) {
      int index = q[0];
      int value = q[1];
      int start = q[2];
      int x = q[3];

      // Update
      _update(1, 0, n - 1, index, value);

      // Query [start, n-1]
      Node res = _query(1, 0, n - 1, start, n - 1);

      ans.add(res.cnt[x]);
    }

    return ans;
  }

  void _build(int node, int left, int right, List<int> nums) {
    if (left == right) {
      int value = nums[left] % k;
      tree[node].prod = value;
      tree[node].cnt[value] = 1;
      return;
    }

    int mid = (left + right) ~/ 2;

    _build(node * 2, left, mid, nums);
    _build(node * 2 + 1, mid + 1, right, nums);

    tree[node] = _merge(tree[node * 2], tree[node * 2 + 1]);
  }

  void _update(
    int node,
    int left,
    int right,
    int index,
    int value,
  ) {
    if (left == right) {
      int v = value % k;

      tree[node] = Node(k);
      tree[node].prod = v;
      tree[node].cnt[v] = 1;

      return;
    }

    int mid = (left + right) ~/ 2;

    if (index <= mid) {
      _update(node * 2, left, mid, index, value);
    } else {
      _update(node * 2 + 1, mid + 1, right, index, value);
    }

    tree[node] = _merge(tree[node * 2], tree[node * 2 + 1]);
  }

  Node _query(
    int node,
    int left,
    int right,
    int ql,
    int qr,
  ) {
    if (ql <= left && right <= qr) {
      return tree[node];
    }

    int mid = (left + right) ~/ 2;

    if (qr <= mid) {
      return _query(node * 2, left, mid, ql, qr);
    }

    if (ql > mid) {
      return _query(node * 2 + 1, mid + 1, right, ql, qr);
    }

    Node leftNode =
        _query(node * 2, left, mid, ql, qr);

    Node rightNode =
        _query(node * 2 + 1, mid + 1, right, ql, qr);

    return _merge(leftNode, rightNode);
  }

  Node _merge(Node a, Node b) {
    Node res = Node(k);

    res.prod = (a.prod * b.prod) % k;

    // Prefixes completely inside left part
    for (int r = 0; r < k; r++) {
      res.cnt[r] += a.cnt[r];
    }

    // Prefixes that cross into right part
    for (int r = 0; r < k; r++) {
      int newRemainder = (a.prod * r) % k;
      res.cnt[newRemainder] += b.cnt[r];
    }

    return res;
  }
}

class Node {
  int prod = 1;
  late List<int> cnt;

  Node(int k) {
    cnt = List.filled(k, 0);
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/find-x-value-of-array-ii/)