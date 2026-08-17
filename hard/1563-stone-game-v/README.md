# Stone Game V

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

There are several stones arranged in a row, and each stone has an associated value which is an integer given in the array stoneValue.

In each round of the game, Alice divides the row into two non-empty rows (i.e. left row and right row), then Bob calculates the value of each row which is the sum of the values of all the stones in this row. Bob throws away the row which has the maximum value, and Alice's score increases by the value of the remaining row. If the value of the two rows are equal, Bob lets Alice decide which row will be thrown away. The next round starts with the remaining row.

The game ends when there is only one stone remaining. Alice's score is initially zero.

Return the maximum score that Alice can obtain.

 
Example 1:

Input: stoneValue = [6,2,3,4,5,5]
Output: 18
Explanation: In the first round, Alice divides the row to [6,2,3], [4,5,5]. The left row has the value 11 and the right row has value 14. Bob throws away the right row and Alice's score is now 11.
In the second round Alice divides the row to [6], [2,3]. This time Bob throws away the left row and Alice's score becomes 16 (11 + 5).
The last round Alice has only one choice to divide the row which is [2], [3]. Bob throws away the right row and Alice's score is now 18 (16 + 2). The game ends because only one stone is remaining in the row.


Example 2:

Input: stoneValue = [7,7,7,7,7,7,7]
Output: 28


Example 3:

Input: stoneValue = [4]
Output: 0


 
Constraints:


	1 <= stoneValue.length <= 500
	1 <= stoneValue[i] <= 106

## Solution

**Language:** Python  
**Runtime:** 949 ms (beats 44.44%)  
**Memory:** 22.7 MB (beats 22.22%)  
**Submitted:** 2026-08-17T07:05:26.165Z  

```py
class Solution(object):
    def stoneGameV(self, stoneValue):
        """
        :type stoneValue: List[int]
        :rtype: int
        """
        n = len(stoneValue)
        A = stoneValue
        dp = [[0] * n for _ in range(n)]
        mx = [[0] * n for _ in range(n)]
        for i in range(n):
            mx[i][i] = A[i]

        for j in range(1, n):
            mid = j
            sm = A[j]
            right = 0
            for i in range(j - 1, -1, -1):
                sm += A[i]
                while (right + A[mid]) * 2 <= sm:
                    right += A[mid]
                    mid -= 1

                if right * 2 == sm:
                    dp[i][j] = mx[i][mid]
                if mid != i:
                    dp[i][j] = max(dp[i][j], mx[i][mid - 1])
                if mid != j:
                    dp[i][j] = max(dp[i][j], mx[j][mid + 1])

                mx[i][j] = max(mx[i][j - 1], dp[i][j] + sm)
                mx[j][i] = max(mx[j][i + 1], dp[i][j] + sm)

        return dp[0][n - 1]
```

---

[View on LeetCode](https://leetcode.com/problems/stone-game-v/)