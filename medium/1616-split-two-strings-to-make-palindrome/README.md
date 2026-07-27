# Split Two Strings to Make Palindrome

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given two strings a and b of the same length. Choose an index and split both strings at the same index, splitting a into two strings: aprefix and asuffix where a = aprefix + asuffix, and splitting b into two strings: bprefix and bsuffix where b = bprefix + bsuffix. Check if aprefix + bsuffix or bprefix + asuffix forms a palindrome.

When you split a string s into sprefix and ssuffix, either ssuffix or sprefix is allowed to be empty. For example, if s = "abc", then "" + "abc", "a" + "bc", "ab" + "c" , and "abc" + "" are valid splits.

Return true if it is possible to form a palindrome string, otherwise return false.

Notice that x + y denotes the concatenation of strings x and y.

 
Example 1:

Input: a = "x", b = "y"
Output: true
Explaination: If either a or b are palindromes the answer is true since you can split in the following way:
aprefix = "", asuffix = "x"
bprefix = "", bsuffix = "y"
Then, aprefix + bsuffix = "" + "y" = "y", which is a palindrome.


Example 2:

Input: a = "xbdef", b = "xecab"
Output: false


Example 3:

Input: a = "ulacfd", b = "jizalu"
Output: true
Explaination: Split them at index 3:
aprefix = "ula", asuffix = "cfd"
bprefix = "jiz", bsuffix = "alu"
Then, aprefix + bsuffix = "ula" + "alu" = "ulaalu", which is a palindrome.


 
Constraints:


	1 <= a.length, b.length <= 105
	a.length == b.length
	a and b consist of lowercase English letters

## Solution

**Language:** dart  
**Runtime:** 2 ms (beats 100.00%)  
**Memory:** 153.6 MB (beats 100.00%)  
**Submitted:** 2026-07-27T06:16:08.485Z  

```dart
class Solution {
  bool checkPalindromeFormation(String a, String b) {
    return check(a, b) || check(b, a);
  }

  bool check(String a, String b) {
    int i = 0;
    int j = a.length - 1;

    while (i < j && a[i] == b[j]) {
      i++;
      j--;
    }

    return isPalindrome(a, i, j) || isPalindrome(b, i, j);
  }

  bool isPalindrome(String s, int left, int right) {
    while (left < right) {
      if (s[left] != s[right]) return false;
      left++;
      right--;
    }
    return true;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/split-two-strings-to-make-palindrome/)