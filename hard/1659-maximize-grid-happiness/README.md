# Maximize Grid Happiness

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given four integers, m, n, introvertsCount, and extrovertsCount. You have an m x n grid, and there are two types of people: introverts and extroverts. There are introvertsCount introverts and extrovertsCount extroverts.

You should decide how many people you want to live in the grid and assign each of them one grid cell. Note that you do not have to have all the people living in the grid.

The happiness of each person is calculated as follows:


	Introverts start with 120 happiness and lose 30 happiness for each neighbor (introvert or extrovert).
	Extroverts start with 40 happiness and gain 20 happiness for each neighbor (introvert or extrovert).


Neighbors live in the directly adjacent cells north, east, south, and west of a person's cell.

The grid happiness is the sum of each person's happiness. Return the maximum possible grid happiness.

 
Example 1:

Input: m = 2, n = 3, introvertsCount = 1, extrovertsCount = 2
Output: 240
Explanation: Assume the grid is 1-indexed with coordinates (row, column).
We can put the introvert in cell (1,1) and put the extroverts in cells (1,3) and (2,3).
- Introvert at (1,1) happiness: 120 (starting happiness) - (0 * 30) (0 neighbors) = 120
- Extrovert at (1,3) happiness: 40 (starting happiness) + (1 * 20) (1 neighbor) = 60
- Extrovert at (2,3) happiness: 40 (starting happiness) + (1 * 20) (1 neighbor) = 60
The grid happiness is 120 + 60 + 60 = 240.
The above figure shows the grid in this example with each person's happiness. The introvert stays in the light green cell while the extroverts live on the light purple cells.


Example 2:

Input: m = 3, n = 1, introvertsCount = 2, extrovertsCount = 1
Output: 260
Explanation: Place the two introverts in (1,1) and (3,1) and the extrovert at (2,1).
- Introvert at (1,1) happiness: 120 (starting happiness) - (1 * 30) (1 neighbor) = 90
- Extrovert at (2,1) happiness: 40 (starting happiness) + (2 * 20) (2 neighbors) = 80
- Introvert at (3,1) happiness: 120 (starting happiness) - (1 * 30) (1 neighbor) = 90
The grid happiness is 90 + 80 + 90 = 260.


Example 3:

Input: m = 2, n = 2, introvertsCount = 4, extrovertsCount = 0
Output: 240


 
Constraints:


	1 <= m, n <= 5
	0 <= introvertsCount, extrovertsCount <= min(m * n, 6)

## Solution

**Language:** Python  
**Runtime:** 6285 ms (beats 12.50%)  
**Memory:** 34.3 MB (beats 37.50%)  
**Submitted:** 2026-08-05T12:12:06.716Z  

```py
class Solution(object):
    def getMaxGridHappiness(self, m, n, introvertsCount, extrovertsCount):
        M = 3 ** n

        bits = [[0] * n for _ in range(M)]
        ix = [0] * M
        ex = [0] * M
        score = [0] * M

        def pair(a, b):
            if a == 0 or b == 0:
                return 0
            if a == 1 and b == 1:
                return -60
            if a == 2 and b == 2:
                return 40
            return -10

        for mask in range(M):
            x = mask
            for i in range(n):
                bits[mask][i] = x % 3
                x //= 3

            s = 0
            for i in range(n):
                if bits[mask][i] == 1:
                    ix[mask] += 1
                    s += 120
                elif bits[mask][i] == 2:
                    ex[mask] += 1
                    s += 40

                if i:
                    s += pair(bits[mask][i], bits[mask][i - 1])

            score[mask] = s

        inter = [[0] * M for _ in range(M)]
        for a in range(M):
            for b in range(M):
                t = 0
                for i in range(n):
                    t += pair(bits[a][i], bits[b][i])
                inter[a][b] = t

        memo = {}

        def dfs(r, prev, intro, ext):
            if r == m:
                return 0

            key = (r, prev, intro, ext)
            if key in memo:
                return memo[key]

            ans = 0
            for cur in range(M):
                if ix[cur] <= intro and ex[cur] <= ext:
                    ans = max(
                        ans,
                        score[cur]
                        + inter[prev][cur]
                        + dfs(r + 1, cur, intro - ix[cur], ext - ex[cur])
                    )

            memo[key] = ans
            return ans

        return dfs(0, 0, introvertsCount, extrovertsCount)
```

---

[View on LeetCode](https://leetcode.com/problems/maximize-grid-happiness/)