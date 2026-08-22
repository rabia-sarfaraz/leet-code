# Maximize Palindrome Length From Subsequences

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given two strings, word1 and word2. You want to construct a string in the following manner:


	Choose some non-empty subsequence subsequence1 from word1.
	Choose some non-empty subsequence subsequence2 from word2.
	Concatenate the subsequences: subsequence1 + subsequence2, to make the string.


Return the length of the longest palindrome that can be constructed in the described manner. If no palindromes can be constructed, return 0.

A subsequence of a string s is a string that can be made by deleting some (possibly none) characters from s without changing the order of the remaining characters.

A palindrome is a string that reads the same forward as well as backward.

 
Example 1:

Input: word1 = "cacb", word2 = "cbba"
Output: 5
Explanation: Choose "ab" from word1 and "cba" from word2 to make "abcba", which is a palindrome.

Example 2:

Input: word1 = "ab", word2 = "ab"
Output: 3
Explanation: Choose "ab" from word1 and "a" from word2 to make "aba", which is a palindrome.

Example 3:

Input: word1 = "aa", word2 = "bb"
Output: 0
Explanation: You cannot construct a palindrome from the described method, so return 0.

 
Constraints:


	1 <= word1.length, word2.length <= 1000
	word1 and word2 consist of lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 61 ms (beats 100.00%)  
**Memory:** 206.9 MB (beats 100.00%)  
**Submitted:** 2026-08-22T04:07:57.148Z  

```dart
class Solution {
  int longestPalindrome(String word1, String word2) {
    String s = word1 + word2;
    int n = s.length;
    int m = word1.length;

    List<List<int>> dp =
        List.generate(n, (_) => List.filled(n, 0));

    int ans = 0;

    for (int i = n - 1; i >= 0; i--) {
      dp[i][i] = 1;

      for (int j = i + 1; j < n; j++) {
        if (s[i] == s[j]) {
          dp[i][j] = dp[i + 1][j - 1] + 2;

          // Pair must use one character from each word
          if (i < m && j >= m) {
            ans = ans > dp[i][j] ? ans : dp[i][j];
          }
        } else {
          dp[i][j] =
              dp[i + 1][j] > dp[i][j - 1]
                  ? dp[i + 1][j]
                  : dp[i][j - 1];
        }
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximize-palindrome-length-from-subsequences/)