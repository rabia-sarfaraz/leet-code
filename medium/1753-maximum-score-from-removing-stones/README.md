# Maximum Score From Removing Stones

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are playing a solitaire game with three piles of stones of sizes a​​​​​​, b,​​​​​​ and c​​​​​​ respectively. Each turn you choose two different non-empty piles, take one stone from each, and add 1 point to your score. The game stops when there are fewer than two non-empty piles (meaning there are no more available moves).

Given three integers a​​​​​, b,​​​​​ and c​​​​​, return the maximum score you can get.

 
Example 1:

Input: a = 2, b = 4, c = 6
Output: 6
Explanation: The starting state is (2, 4, 6). One optimal set of moves is:
- Take from 1st and 3rd piles, state is now (1, 4, 5)
- Take from 1st and 3rd piles, state is now (0, 4, 4)
- Take from 2nd and 3rd piles, state is now (0, 3, 3)
- Take from 2nd and 3rd piles, state is now (0, 2, 2)
- Take from 2nd and 3rd piles, state is now (0, 1, 1)
- Take from 2nd and 3rd piles, state is now (0, 0, 0)
There are fewer than two non-empty piles, so the game ends. Total: 6 points.


Example 2:

Input: a = 4, b = 4, c = 6
Output: 7
Explanation: The starting state is (4, 4, 6). One optimal set of moves is:
- Take from 1st and 2nd piles, state is now (3, 3, 6)
- Take from 1st and 3rd piles, state is now (2, 3, 5)
- Take from 1st and 3rd piles, state is now (1, 3, 4)
- Take from 1st and 3rd piles, state is now (0, 3, 3)
- Take from 2nd and 3rd piles, state is now (0, 2, 2)
- Take from 2nd and 3rd piles, state is now (0, 1, 1)
- Take from 2nd and 3rd piles, state is now (0, 0, 0)
There are fewer than two non-empty piles, so the game ends. Total: 7 points.


Example 3:

Input: a = 1, b = 8, c = 8
Output: 8
Explanation: One optimal set of moves is to take from the 2nd and 3rd piles for 8 turns until they are empty.
After that, there are fewer than two non-empty piles, so the game ends.


 
Constraints:


	1 <= a, b, c <= 105

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 150.2 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:57:31.994Z  

```dart
class Solution {
  int maximumScore(int a, int b, int c) {
    List<int> piles = [a, b, c];
    piles.sort();

    // Do smallest piles se pairs banao
    int small = piles[0];
    int medium = piles[1];
    int large = piles[2];

    int score = 0;

    // Case 1: largest pile <= other two combined
    if (large <= small + medium) {
      score = (a + b + c) ~/ 2;
    } 
    // Case 2: largest pile zyada hai
    else {
      score = small + medium;
    }

    return score;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-score-from-removing-stones/)