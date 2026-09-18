# Maximum Number of Non-Overlapping Substrings

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

Given a string `s` of lowercase letters, you need to find the maximum number of **non-empty** substrings of `s` that meet the following conditions:

- The substrings do not overlap, that is for any two substrings s[i..j] and s[x..y], either j < x or i > y is true.
- A substring that contains a certain character c must also contain all occurrences of c.

Find *the maximum number of substrings that meet the above conditions*. If there are multiple solutions with the same number of substrings, *return the one with minimum total length. *It can be shown that there exists a unique solution of minimum total length.

Notice that you can return the substrings in **any** order.

 

**Example 1:**

```
Input: s = "adefaddaccc"
Output: ["e","f","ccc"]
Explanation: The following are all the possible substrings that meet the conditions:
[
  "adefaddaccc"
  "adefadda",
  "ef",
  "e",
  "f",
  "ccc",
]
If we choose the first string, we cannot choose anything else and we'd get only 1. If we choose "adefadda", we are left with "ccc" which is the only one that doesn't overlap, thus obtaining 2 substrings. Notice also, that it's not optimal to choose "ef" since it can be split into two. Therefore, the optimal way is to choose ["e","f","ccc"] which gives us 3 substrings. No other solution of the same number of substrings exist.

```

**Example 2:**

```
Input: s = "abbaccd"
Output: ["d","bb","cc"]
Explanation: Notice that while the set of substrings ["d","abba","cc"] also has length 3, it's considered incorrect since it has larger total length.

```

 

**Constraints:**

- 1 <= s.length <= 105
- s contains only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 7 ms (beats 100.00%)  
**Memory:** 157.7 MB (beats 100.00%)  
**Submitted:** 2026-09-18T04:12:01.815Z  

```dart
class Solution {
  List<String> maxNumOfSubstrings(String s) {
    int n = s.length;

    List<int> first = List.filled(26, n);
    List<int> last = List.filled(26, -1);

    // First aur last occurrence
    for (int i = 0; i < n; i++) {
      int c = s.codeUnitAt(i) - 97;

      if (first[c] == n) {
        first[c] = i;
      }

      last[c] = i;
    }

    List<List<int>> intervals = [];

    // Har character se minimum valid interval banao
    for (int c = 0; c < 26; c++) {
      if (last[c] == -1) continue;

      int l = first[c];
      int r = last[c];
      bool valid = true;

      int i = l;

      while (i <= r) {
        int x = s.codeUnitAt(i) - 97;

        // Is character ka first occurrence
        // interval ke bahar hai => invalid
        if (first[x] < l) {
          valid = false;
          break;
        }

        if (last[x] > r) {
          r = last[x];
        }

        i++;
      }

      if (valid) {
        intervals.add([l, r]);
      }
    }

    // End ke according sort
    intervals.sort((a, b) => a[1].compareTo(b[1]));

    List<String> answer = [];
    int prevEnd = -1;

    // Maximum non-overlapping intervals
    for (List<int> interval in intervals) {
      int l = interval[0];
      int r = interval[1];

      if (l > prevEnd) {
        answer.add(s.substring(l, r + 1));
        prevEnd = r;
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-number-of-non-overlapping-substrings/)