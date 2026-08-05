# Minimum Deletions to Make Character Frequencies Unique

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A string s is called good if there are no two different characters in s that have the same frequency.

Given a string s, return the minimum number of characters you need to delete to make s good.

The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.

 
Example 1:

Input: s = "aab"
Output: 0
Explanation: s is already good.


Example 2:

Input: s = "aaabbbcc"
Output: 2
Explanation: You can delete two 'b's resulting in the good string "aaabcc".
Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".

Example 3:

Input: s = "ceabaacb"
Output: 2
Explanation: You can delete both 'c's resulting in the good string "eabaab".
Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).


 
Constraints:


	1 <= s.length <= 105
	s contains only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 7 ms (beats 100.00%)  
**Memory:** 152.9 MB (beats 100.00%)  
**Submitted:** 2026-08-05T11:42:52.247Z  

```dart
class Solution {
  int minDeletions(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }

    Set<int> used = {};
    int deletions = 0;

    for (int f in freq) {
      while (f > 0 && used.contains(f)) {
        f--;
        deletions++;
      }
      if (f > 0) {
        used.add(f);
      }
    }

    return deletions;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/)