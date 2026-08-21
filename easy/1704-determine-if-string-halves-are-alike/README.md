# Determine if String Halves Are Alike

![Difficulty](https://img.shields.io/badge/Difficulty-Easy-green)

## Problem

You are given a string s of even length. Split this string into two halves of equal lengths, and let a be the first half and b be the second half.

Two strings are alike if they have the same number of vowels ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'). Notice that s contains uppercase and lowercase letters.

Return true if a and b are alike. Otherwise, return false.

 
Example 1:

Input: s = "book"
Output: true
Explanation: a = "bo" and b = "ok". a has 1 vowel and b has 1 vowel. Therefore, they are alike.


Example 2:

Input: s = "textbook"
Output: false
Explanation: a = "text" and b = "book". a has 1 vowel whereas b has 2. Therefore, they are not alike.
Notice that the vowel o is counted twice.


 
Constraints:


	2 <= s.length <= 1000
	s.length is even.
	s consists of uppercase and lowercase letters.

## Solution

**Language:** dart  
**Runtime:** 1 ms (beats 100.00%)  
**Memory:** 150.9 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:11:46.468Z  

```dart
class Solution {
  bool halvesAreAlike(String s) {
    int mid = s.length ~/ 2;
    int count1 = 0;
    int count2 = 0;

    String vowels = "aeiouAEIOU";

    for (int i = 0; i < mid; i++) {
      if (vowels.contains(s[i])) {
        count1++;
      }
    }

    for (int i = mid; i < s.length; i++) {
      if (vowels.contains(s[i])) {
        count2++;
      }
    }

    return count1 == count2;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/determine-if-string-halves-are-alike/)