# Minimum Number of Operations to Move All Balls to Each Box

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You have n boxes. You are given a binary string boxes of length n, where boxes[i] is '0' if the ith box is empty, and '1' if it contains one ball.

In one operation, you can move one ball from a box to an adjacent box. Box i is adjacent to box j if abs(i - j) == 1. Note that after doing so, there may be more than one ball in some boxes.

Return an array answer of size n, where answer[i] is the minimum number of operations needed to move all the balls to the ith box.

Each answer[i] is calculated considering the initial state of the boxes.

 
Example 1:

Input: boxes = "110"
Output: [1,1,3]
Explanation: The answer for each box is as follows:
1) First box: you will have to move one ball from the second box to the first box in one operation.
2) Second box: you will have to move one ball from the first box to the second box in one operation.
3) Third box: you will have to move one ball from the first box to the third box in two operations, and move one ball from the second box to the third box in one operation.


Example 2:

Input: boxes = "001011"
Output: [11,8,5,4,3,4]

 
Constraints:


	n == boxes.length
	1 <= n <= 2000
	boxes[i] is either '0' or '1'.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 152.1 MB (beats 25.00%)  
**Submitted:** 2026-08-22T04:06:00.684Z  

```dart
class Solution {
  List<int> minOperations(String boxes) {
    int n = boxes.length;
    List<int> ans = List.filled(n, 0);

    int balls = 0;
    int moves = 0;

    // Left side se
    for (int i = 0; i < n; i++) {
      ans[i] += moves;

      if (boxes[i] == '1') {
        balls++;
      }

      moves += balls;
    }

    balls = 0;
    moves = 0;

    // Right side se
    for (int i = n - 1; i >= 0; i--) {
      ans[i] += moves;

      if (boxes[i] == '1') {
        balls++;
      }

      moves += balls;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box/)