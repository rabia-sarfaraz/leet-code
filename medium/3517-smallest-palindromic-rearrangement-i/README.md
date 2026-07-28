# Smallest Palindromic Rearrangement I

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a palindromic string s.

Return the lexicographically smallest palindromic permutation of s.

 
Example 1:


Input: s = "z"

Output: "z"

Explanation:

A string of only one character is already the lexicographically smallest palindrome.


Example 2:


Input: s = "babab"

Output: "abbba"

Explanation:

Rearranging "babab" → "abbba" gives the smallest lexicographic palindrome.


Example 3:


Input: s = "daccad"

Output: "acddca"

Explanation:

Rearranging "daccad" → "acddca" gives the smallest lexicographic palindrome.


 
Constraints:


	1 <= s.length <= 105
	s consists of lowercase English letters.
	s is guaranteed to be palindromic.

## Solution

**Language:** dart  
**Runtime:** 132 ms (beats 100.00%)  
**Memory:** 172 MB (beats 100.00%)  
**Submitted:** 2026-07-28T04:49:09.694Z  

```dart
class Solution {
  String smallestPalindrome(String s) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 97]++;
    }

    StringBuffer left = StringBuffer();
    String mid = "";

    for (int i = 0; i < 26; i++) {
      for (int j = 0; j < freq[i] ~/ 2; j++) {
        left.writeCharCode(i + 97);
      }
      if (freq[i].isOdd) {
        mid = String.fromCharCode(i + 97);
      }
    }

    String firstHalf = left.toString();
    String secondHalf = firstHalf.split('').reversed.join();

    return firstHalf + mid + secondHalf;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/smallest-palindromic-rearrangement-i/)