# Maximum Score From Removing Substrings

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a string s and two integers x and y. You can perform two types of operations any number of times.


	Remove substring "ab" and gain x points.

	
		For example, when removing "ab" from "cabxbae" it becomes "cxbae".
	
	
	Remove substring "ba" and gain y points.
	
		For example, when removing "ba" from "cabxbae" it becomes "cabxe".
	
	


Return the maximum points you can gain after applying the above operations on s.

 
Example 1:

Input: s = "cdbcbbaaabab", x = 4, y = 5
Output: 19
Explanation:
- Remove the "ba" underlined in "cdbcbbaaabab". Now, s = "cdbcbbaaab" and 5 points are added to the score.
- Remove the "ab" underlined in "cdbcbbaaab". Now, s = "cdbcbbaa" and 4 points are added to the score.
- Remove the "ba" underlined in "cdbcbbaa". Now, s = "cdbcba" and 5 points are added to the score.
- Remove the "ba" underlined in "cdbcba". Now, s = "cdbc" and 5 points are added to the score.
Total score = 5 + 4 + 5 + 5 = 19.

Example 2:

Input: s = "aabbaaxybbaabb", x = 5, y = 4
Output: 20


 
Constraints:


	1 <= s.length <= 105
	1 <= x, y <= 104
	s consists of lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 63 ms (beats 100.00%)  
**Memory:** 199.7 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:36:37.368Z  

```dart
class Solution {
  int maximumGain(String s, int x, int y) {
    int score = 0;

    // Pehle higher-score pair remove karo
    String first = x >= y ? "ab" : "ba";
    String second = x >= y ? "ba" : "ab";

    int firstScore = x >= y ? x : y;
    int secondScore = x >= y ? y : x;

    List<String> stack = [];

    // First pair remove
    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (stack.isNotEmpty &&
          stack.last == first[0] &&
          c == first[1]) {
        stack.removeLast();
        score += firstScore;
      } else {
        stack.add(c);
      }
    }

    // Remaining string mein second pair remove
    List<String> stack2 = [];

    for (String c in stack) {
      if (stack2.isNotEmpty &&
          stack2.last == second[0] &&
          c == second[1]) {
        stack2.removeLast();
        score += secondScore;
      } else {
        stack2.add(c);
      }
    }

    return score;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/maximum-score-from-removing-substrings/)