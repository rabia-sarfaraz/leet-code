# Sum of Beauty of All Substrings

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

The beauty of a string is the difference in frequencies between the most frequent and least frequent characters.


	For example, the beauty of "abaacc" is 3 - 1 = 2.


Given a string s, return the sum of beauty of all of its substrings.

 
Example 1:

Input: s = "aabcb"
Output: 5
Explanation: The substrings with non-zero beauty are ["aab","aabc","aabcb","abcb","bcb"], each with beauty equal to 1.

Example 2:

Input: s = "aabcbaa"
Output: 17


 
Constraints:


	1 <= s.length <= 500
	s consists of only lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 125 ms (beats 100.00%)  
**Memory:** 147.7 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:29:14.168Z  

```dart
class Solution {
  int beautySum(String s) {
    int result = 0;

    for (int i = 0; i < s.length; i++) {
      List<int> freq = List.filled(26, 0);

      for (int j = i; j < s.length; j++) {
        int index = s.codeUnitAt(j) - 'a'.codeUnitAt(0);
        freq[index]++;

        int maxFreq = 0;
        int minFreq = 1000000;

        for (int k = 0; k < 26; k++) {
          if (freq[k] > 0) {
            maxFreq = maxFreq > freq[k] ? maxFreq : freq[k];
            minFreq = minFreq < freq[k] ? minFreq : freq[k];
          }
        }

        result += maxFreq - minFreq;
      }
    }

    return result;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/sum-of-beauty-of-all-substrings/)