# Minimum Operations to Sort a String

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a string `s` consisting of lowercase English letters.

In one operation, you can select any **substring** of `s` that is **not** the entire string and **sort** it in **non-descending alphabetical** order.

Return the **minimum** number of operations required to make `s` sorted in **non-descending** order. If it is not possible, return -1.

 

**Example 1:**

**Input:** s = "dog"

**Output:** 1

**Explanation:**​​​​​​​

- Sort substring "og" to "go".
- Now, s = "dgo", which is sorted in ascending order. Thus, the answer is 1.

**Example 2:**

**Input:** s = "card"

**Output:** 2

**Explanation:**

- Sort substring "car" to "acr", so s = "acrd".
- Sort substring "rd" to "dr", making s = "acdr", which is sorted in ascending order. Thus, the answer is 2.

**Example 3:**

**Input:** s = "gf"

**Output:** -1

**Explanation:**

- It is impossible to sort s under the given constraints. Thus, the answer is -1.

 

**Constraints:**

- 1 <= s.length <= 105
- s consists of only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 24 ms (beats 100.00%)  
**Memory:** 149.1 MB (beats 100.00%)  
**Submitted:** 2026-10-21T04:57:21.775Z  

```dart
class Solution {
  int minOperations(String s) {
    int n = s.length;
    bool sorted = true;

    for (int i = 1; i < n; i++) {
      if (s[i].compareTo(s[i - 1]) < 0) {
        sorted = false;
        break;
      }
    }

    if (sorted) return 0;
    if (n == 2) return -1;

    String minChar = s[0];
    String maxChar = s[0];

    for (int i = 1; i < n; i++) {
      if (s[i].compareTo(minChar) < 0) {
        minChar = s[i];
      }

      if (s[i].compareTo(maxChar) > 0) {
        maxChar = s[i];
      }
    }

    if (s[0] == minChar || s[n - 1] == maxChar) {
      return 1;
    }

    for (int i = 1; i < n - 1; i++) {
      if (s[i] == minChar || s[i] == maxChar) {
        return 2;
      }
    }

    return 3;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/minimum-operations-to-sort-a-string/)