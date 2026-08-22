# Change Minimum Characters to Satisfy One of Three Conditions

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two strings a and b that consist of lowercase letters. In one operation, you can change any character in a or b to any lowercase letter.

Your goal is to satisfy one of the following three conditions:


	Every letter in a is strictly less than every letter in b in the alphabet.
	Every letter in b is strictly less than every letter in a in the alphabet.
	Both a and b consist of only one distinct letter.


Return the minimum number of operations needed to achieve your goal.

 
Example 1:

Input: a = "aba", b = "caa"
Output: 2
Explanation: Consider the best way to make each condition true:
1) Change b to "ccc" in 2 operations, then every letter in a is less than every letter in b.
2) Change a to "bbb" and b to "aaa" in 3 operations, then every letter in b is less than every letter in a.
3) Change a to "aaa" and b to "aaa" in 2 operations, then a and b consist of one distinct letter.
The best way was done in 2 operations (either condition 1 or condition 3).


Example 2:

Input: a = "dabadd", b = "cda"
Output: 3
Explanation: The best way is to make condition 1 true by changing b to "eee".


 
Constraints:


	1 <= a.length, b.length <= 105
	a and b consist only of lowercase letters.

## Solution

**Language:** dart  
**Runtime:** 2 ms (beats 100.00%)  
**Memory:** 151 MB (beats 100.00%)  
**Submitted:** 2026-08-22T03:49:17.732Z  

```dart
class Solution {
  int minCharacters(String a, String b) {
    List<int> countA = List.filled(26, 0);
    List<int> countB = List.filled(26, 0);

    for (int i = 0; i < a.length; i++) {
      countA[a.codeUnitAt(i) - 97]++;
    }

    for (int i = 0; i < b.length; i++) {
      countB[b.codeUnitAt(i) - 97]++;
    }

    int ans = a.length + b.length;

    // Conditions 1 and 2
    for (int i = 0; i < 25; i++) {
      int aGreater = 0;
      int bGreater = 0;

      for (int j = i + 1; j < 26; j++) {
        aGreater += countA[j];
        bGreater += countB[j];
      }

      int aLessOrEqual = a.length - aGreater;
      int bLessOrEqual = b.length - bGreater;

      // Every character in a < every character in b
      // a: <= i, b: > i
      int change1 = aGreater + bLessOrEqual;

      // Every character in b < every character in a
      // b: <= i, a: > i
      int change2 = bGreater + aLessOrEqual;

      ans = ans < change1 ? ans : change1;
      ans = ans < change2 ? ans : change2;
    }

    // Condition 3:
    // Both strings contain only one same character
    for (int i = 0; i < 26; i++) {
      int changes =
          (a.length - countA[i]) +
          (b.length - countB[i]);

      ans = ans < changes ? ans : changes;
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/change-minimum-characters-to-satisfy-one-of-three-conditions/)