# Minimum Changes to Make K Semi-palindromes

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a string `s` and an integer `k`, partition `s` into `k` **substrings** such that the letter changes needed to make each substring a **semi-palindrome** are minimized.

Return the ***minimum** number of letter changes* required*.*

A **semi-palindrome** is a special type of string that can be divided into **palindromes** based on a repeating pattern. To check if a string is a semi-palindrome:​

- Choose a positive divisor d of the string's length. d can range from 1 up to, but not including, the string's length. For a string of length 1, it does not have a valid divisor as per this definition, since the only divisor is its length, which is not allowed.
- For a given divisor d, divide the string into groups where each group contains characters from the string that follow a repeating pattern of length d. Specifically, the first group consists of characters at positions 1, 1 + d, 1 + 2d, and so on; the second group includes characters at positions 2, 2 + d, 2 + 2d, etc.
- The string is considered a semi-palindrome if each of these groups forms a palindrome.

Consider the string `"abcabc"`:

- The length of "abcabc" is 6. Valid divisors are 1, 2, and 3.
- For d = 1: The entire string "abcabc" forms one group. Not a palindrome.
- For d = 2: Group 1 (positions 1, 3, 5): "acb" Group 2 (positions 2, 4, 6): "bac" Neither group forms a palindrome.
- For d = 3: Group 1 (positions 1, 4): "aa" Group 2 (positions 2, 5): "bb" Group 3 (positions 3, 6): "cc" All groups form palindromes. Therefore, "abcabc" is a semi-palindrome.

 

Original
Dart
**Example 1: **

**Input: ** s = "abcac", k = 2

**Output: ** 1

**Explanation: ** Divide `s` into `"ab"` and `"cac"`. `"cac"` is already semi-palindrome. Change `"ab"` to `"aa"`, it becomes semi-palindrome with `d = 1`.

**Example 2: **

**Input: ** s = "abcdef", k = 2

**Output: ** 2

**Explanation: ** Divide `s` into substrings `"abc"` and `"def"`. Each needs one change to become semi-palindrome.

**Example 3: **

**Input: ** s = "aabbaa", k = 3

**Output: ** 0

**Explanation: ** Divide `s` into substrings `"aa"`, `"bb"` and `"aa"`. All are already semi-palindromes.

 

**Constraints:**

- 2 <= s.length <= 200
- 1 <= k <= s.length / 2
- s contains only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 185 ms (beats 100.00%)  
**Memory:** 201.6 MB (beats 100.00%)  
**Submitted:** 2026-11-17T06:28:37.666Z  

```dart

class Solution {
  int minimumChanges(String s, int k) {
    int n = s.length;
    const int inf = 1000000000;

    List<List<int>> cost = List.generate(
      n,
      (_) => List.filled(n, inf),
    );

    // Calculate minimum changes for every substring
    for (int len = 2; len <= n; len++) {
      for (int l = 0; l + len <= n; l++) {
        int r = l + len - 1;

        for (int d = 1; d < len; d++) {
          if (len % d != 0) continue;

          int groups = len ~/ d;
          int changes = 0;

          for (int offset = 0; offset < d; offset++) {
            for (int j = 0; j < groups ~/ 2; j++) {
              int a = l + offset + j * d;
              int b = l + offset + (groups - 1 - j) * d;

              if (s[a] != s[b]) {
                changes++;
              }
            }
          }

          if (changes < cost[l][r]) {
            cost[l][r] = changes;
          }
        }
      }
    }

    // Dynamic Programming
    List<List<int>> dp = List.generate(
      k + 1,
      (_) => List.filled(n + 1, inf),
    );

    dp[0][0] = 0;

    for (int groups = 1; groups <= k; groups++) {
      for (int end = groups * 2; end <= n; end++) {
        for (int start = (groups - 1) * 2;
            start <= end - 2;
            start++) {

          if (dp[groups - 1][start] == inf) continue;

          int current = dp[groups - 1][start] +
              cost[start][end - 1];

          if (current < dp[groups][end]) {
            dp[groups][end] = current;
          }
        }
      }
    }

    return dp[k][n];
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/minimum-changes-to-make-k-semi-palindromes/)