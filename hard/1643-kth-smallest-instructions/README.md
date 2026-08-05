# Kth Smallest Instructions

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Bob is standing at cell (0, 0), and he wants to reach destination: (row, column). He can only travel right and down. You are going to help Bob by providing instructions for him to reach destination.

The instructions are represented as a string, where each character is either:


	'H', meaning move horizontally (go right), or
	'V', meaning move vertically (go down).


Multiple instructions will lead Bob to destination. For example, if destination is (2, 3), both "HHHVV" and "HVHVH" are valid instructions.

However, Bob is very picky. Bob has a lucky number k, and he wants the kth lexicographically smallest instructions that will lead him to destination. k is 1-indexed.

Given an integer array destination and an integer k, return the kth lexicographically smallest instructions that will take Bob to destination.

 
Example 1:



Input: destination = [2,3], k = 1
Output: "HHHVV"
Explanation: All the instructions that reach (2, 3) in lexicographic order are as follows:
["HHHVV", "HHVHV", "HHVVH", "HVHHV", "HVHVH", "HVVHH", "VHHHV", "VHHVH", "VHVHH", "VVHHH"].


Example 2:



Input: destination = [2,3], k = 2
Output: "HHVHV"


Example 3:



Input: destination = [2,3], k = 3
Output: "HHVVH"


 
Constraints:


	destination.length == 2
	1 <= row, column <= 15
	1 <= k <= nCr(row + column, row), where nCr(a, b) denotes a choose b​​​​​.

## Solution

**Language:** dart  
**Runtime:** 4 ms (beats 100.00%)  
**Memory:** 150.8 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:41:38.846Z  

```dart
class Solution {
  String kthSmallestPath(List<int> destination, int k) {
    int v = destination[0];
    int h = destination[1];

    // Precompute combinations up to 30 (constraints)
    List<List<int>> c =
        List.generate(v + h + 1, (_) => List.filled(v + h + 1, 0));

    for (int i = 0; i <= v + h; i++) {
      c[i][0] = 1;
      c[i][i] = 1;
      for (int j = 1; j < i; j++) {
        c[i][j] = c[i - 1][j - 1] + c[i - 1][j];
      }
    }

    StringBuffer ans = StringBuffer();

    while (h > 0 || v > 0) {
      if (h == 0) {
        ans.write('V');
        v--;
      } else if (v == 0) {
        ans.write('H');
        h--;
      } else {
        int cnt = c[h + v - 1][h - 1];

        if (k <= cnt) {
          ans.write('H');
          h--;
        } else {
          ans.write('V');
          k -= cnt;
          v--;
        }
      }
    }

    return ans.toString();
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/kth-smallest-instructions/)