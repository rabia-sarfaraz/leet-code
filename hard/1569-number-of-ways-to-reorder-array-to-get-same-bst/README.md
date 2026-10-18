# Number of Ways to Reorder Array to Get Same BST

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given an array `nums` that represents a permutation of integers from `1` to `n`. We are going to construct a binary search tree (BST) by inserting the elements of `nums` in order into an initially empty BST. Find the number of different ways to reorder `nums` so that the constructed BST is identical to that formed from the original array `nums`.

- For example, given nums = [2,1,3], we will have 2 as the root, 1 as a left child, and 3 as a right child. The array [2,3,1] also yields the same BST but [3,2,1] yields a different BST.

Return *the number of ways to reorder* `nums` *such that the BST formed is identical to the original BST formed from* `nums`.

Since the answer may be very large, **return it modulo **`109 + 7`.

 

**Example 1:**

```
Input: nums = [2,1,3]
Output: 1
Explanation: We can reorder nums to be [2,3,1] which will yield the same BST. There are no other ways to reorder nums which will yield the same BST.

```

**Example 2:**

```
Input: nums = [3,4,5,1,2]
Output: 5
Explanation: The following 5 arrays will yield the same BST: 
[3,1,2,4,5]
[3,1,4,2,5]
[3,1,4,5,2]
[3,4,1,2,5]
[3,4,1,5,2]

```

**Example 3:**

```
Input: nums = [1,2,3]
Output: 0
Explanation: There are no other orderings of nums that will yield the same BST.

```

 

**Constraints:**

- 1 <= nums.length <= 1000
- 1 <= nums[i] <= nums.length
- All integers in nums are distinct.

## Solution

**Language:** dart  
**Runtime:** 122 ms (beats 100.00%)  
**Memory:** 191.8 MB (beats 100.00%)  
**Submitted:** 2026-10-18T02:26:14.274Z  

```dart

class Solution {
  static const int mod = 1000000007;
  late List<List<int>> comb;

  int numOfWays(List<int> nums) {
    int n = nums.length;

    comb = List.generate(
      n + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (int i = 0; i <= n; i++) {
      comb[i][0] = 1;
      comb[i][i] = 1;

      for (int j = 1; j < i; j++) {
        comb[i][j] =
            (comb[i - 1][j - 1] + comb[i - 1][j]) % mod;
      }
    }

    return (ways(nums) - 1 + mod) % mod;
  }

  int ways(List<int> nums) {
    int n = nums.length;

    if (n <= 2) return 1;

    int root = nums[0];
    List<int> left = [];
    List<int> right = [];

    for (int i = 1; i < n; i++) {
      if (nums[i] < root) {
        left.add(nums[i]);
      } else {
        right.add(nums[i]);
      }
    }

    int result = comb[n - 1][left.length];

    result = (result * ways(left)) % mod;
    result = (result * ways(right)) % mod;

    return result;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst/)