# Construct the Lexicographically Largest Valid Sequence

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Given an integer n, find a sequence with elements in the range [1, n] that satisfies all of the following:


	The integer 1 occurs once in the sequence.
	Each integer between 2 and n occurs twice in the sequence.
	For every integer i between 2 and n, the distance between the two occurrences of i is exactly i.


The distance between two numbers on the sequence, a[i] and a[j], is the absolute difference of their indices, |j - i|.

Return the lexicographically largest sequence. It is guaranteed that under the given constraints, there is always a solution. 

A sequence a is lexicographically larger than a sequence b (of the same length) if in the first position where a and b differ, sequence a has a number greater than the corresponding number in b. For example, [0,1,9,0] is lexicographically larger than [0,1,5,6] because the first position they differ is at the third number, and 9 is greater than 5.

 
Example 1:

Input: n = 3
Output: [3,1,2,3,2]
Explanation: [2,3,2,1,3] is also a valid sequence, but [3,1,2,3,2] is the lexicographically largest valid sequence.


Example 2:

Input: n = 5
Output: [5,3,1,4,3,5,2,4,2]


 
Constraints:


	1 <= n <= 20

## Solution

**Language:** dart  
**Runtime:** 2 ms (beats 100.00%)  
**Memory:** 149.5 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:37:05.083Z  

```dart
class Solution {
  List<int> constructDistancedSequence(int n) {
    int len = 2 * n - 1;
    List<int> ans = List.filled(len, 0);
    List<bool> used = List.filled(n + 1, false);

    bool backtrack(int index) {
      // Saari positions fill ho gayi
      if (index == len) {
        return true;
      }

      // Already filled position skip karo
      if (ans[index] != 0) {
        return backtrack(index + 1);
      }

      // Largest number se start karo
      for (int num = n; num >= 1; num--) {
        if (used[num]) continue;

        if (num == 1) {
          ans[index] = 1;
          used[1] = true;

          if (backtrack(index + 1)) {
            return true;
          }

          ans[index] = 0;
          used[1] = false;
        } else {
          int second = index + num;

          // Second position valid aur empty honi chahiye
          if (second >= len || ans[second] != 0) {
            continue;
          }

          ans[index] = num;
          ans[second] = num;
          used[num] = true;

          if (backtrack(index + 1)) {
            return true;
          }

          ans[index] = 0;
          ans[second] = 0;
          used[num] = false;
        }
      }

      return false;
    }

    backtrack(0);

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence/)